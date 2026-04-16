from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from .serializers import RegisterSerializer,MyTokenObtainPairSerializer, CanteenSerializer, MenuSerializer, OrderSerializer, UserSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.tokens import RefreshToken
from django.shortcuts import get_object_or_404
from .models import Canteen, Menu, Cart, CartItem, Product, Order , OrderItem,UserProfile
from decimal import Decimal



# Signup API
@api_view(['POST'])
def register(request):
    print("Incoming data:", request.data)
    serializer = RegisterSerializer(data=request.data)
    try:
        if serializer.is_valid():
            print(serializer.save())
            user = serializer.save()
            print("incoming 2")
            refresh = RefreshToken.for_user(user)
            access = str(refresh.access_token)
            refresh = RefreshToken.for_user(user)
            print("Created user:", user.username)

            # Generate JWT tokens for auto login
            refresh = RefreshToken.for_user(user)
            return Response({
                "msg": "User created successfully",
                "refresh": str(refresh),
                "access": access,
                "username": user.username,
                "email": user.email,
            }, status=status.HTTP_201_CREATED)

        print("Validation errors:", serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    except Exception as e:
        print("Exception:", str(e))
        return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# Login API
class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        token['username'] = user.username
        token['email'] = user.email
        return token
    
class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer

    def post(self, request, *args, **kwargs):
        print("Login request data:", request.data)
        return super().post(request, *args, **kwargs)
    
    


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def logout_and_blacklist(request):
    refresh_token = request.data.get("refresh")
    if not refresh_token:
        return Response({"detail": "Refresh token required."}, status=status.HTTP_400_BAD_REQUEST)
    try:
        token = RefreshToken(refresh_token)
        token.blacklist()
    except Exception as e:
        return Response({"detail": "Invalid token or already blacklisted.", "error": str(e)},
                        status=status.HTTP_400_BAD_REQUEST)
    return Response({"detail": "Logout successful."}, status=status.HTTP_205_RESET_CONTENT)
    

@api_view(['GET'])
def get_canteens(request):
    canteens = Canteen.objects.all()
    serializer = CanteenSerializer(canteens, many=True)
    return Response(serializer.data)

@api_view(["GET"])
def canteen_menu(request, canteen_id):
    try:
        canteen = Canteen.objects.get(id=canteen_id)
        print(canteen)
    except Canteen.DoesNotExist:
        return Response({"error": "Canteen not found"}, status=404)

    menu_items = Menu.objects.filter(canteen=canteen)
    serializer = MenuSerializer(menu_items, many=True)
    return Response(serializer.data)


@api_view(["POST"])
def add_to_cart(request, canteen_id, product_id):
    user = request.user
    canteen = get_object_or_404(Canteen, id=canteen_id)
    product = get_object_or_404(Product, id=product_id)

    # ✅ Get or create cart for this user + canteen
    cart, created = Cart.objects.get_or_create(user=user, canteen=canteen)

    quantity = int(request.data.get("quantity", 1))

    # ✅ Get or create cart item
    cart_item, created = CartItem.objects.get_or_create(cart=cart, product=product)

    # Increase quantity if already exists
    if created:
        cart_item.quantity = quantity   # First time → set exact quantity
    else:
        cart_item.quantity += quantity  # Already exists → add to existing
    cart_item.save()

    return Response({"message": f"{product.name} added to cart at {canteen.name}"})


@api_view(["POST"])
def update_cart_item(request, canteen_id, product_id):
    user = request.user
    cart = get_object_or_404(Cart, user=user, canteen_id=canteen_id)
    cart_item = get_object_or_404(CartItem, cart=cart, product_id=product_id)

    quantity = request.data.get("quantity")
    print(quantity)
    if quantity and int(quantity) > 0:
        cart_item.quantity = int(quantity)
        cart_item.save()
        return Response({"message": "Quantity updated", "quantity": cart_item.quantity})
    return Response({"error": "Invalid quantity"}, status=400)



@api_view(["GET"])
@permission_classes([IsAuthenticated])
def view_cart(request, canteen_id):
    user = request.user
    canteen = get_object_or_404(Canteen, id=canteen_id)

    # Fetch the user's cart for this canteen
    cart = Cart.objects.filter(user=user, canteen=canteen).first()
    if not cart:
        return Response({"message": "Cart is empty"}, status=404)

    # Get items in the cart
    cart_items = cart.items.select_related("product")

    items_data = []
    total_price = 0

    for item in cart_items:
        item_total = item.quantity * item.product.price
        total_price += item_total


        items_data.append({
            "product_id": item.product.id,
            "product_name": item.product.name,
            "price": item.product.price,
            "quantity": item.quantity,
            "total": item_total,
            "url": item.product.url
        })

    return Response({
        "canteen": cart.canteen.name,
        "user": user.username,
        "items": items_data,
        "total_price": total_price
    })


@api_view(["DELETE"])
def remove_from_cart(request, canteen_id, product_id):
    user = request.user
    canteen = get_object_or_404(Canteen, id=canteen_id)
    product = get_object_or_404(Product, id=product_id)

    cart = get_object_or_404(Cart, user=user, canteen=canteen)
    cart_item = get_object_or_404(CartItem, cart=cart, product=product)

    cart_item.delete()

    return Response({"message": f"{product.name} removed from cart"})


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def place_order(request, canteen_id):
    user = request.user
    canteen = get_object_or_404(Canteen, id=canteen_id)
    
    cart = Cart.objects.filter(user=user, canteen=canteen).first()
    if not cart or not cart.items.exists():
        return Response({"error": "Cart is empty"}, status=400)

    order = Order.objects.create(user=user, canteen=canteen, total_price=0)
    total_price = 0

    for item in cart.items.all():
        item_total = item.quantity * item.product.price
        total_price += item_total

        OrderItem.objects.create(
            order=order,
            product=item.product,
            quantity=item.quantity,
            price=item.product.price,
        )

    order.total_price = total_price
    order.save()

    # Clear cart
    cart.items.all().delete()

    return Response({"message": "Order placed successfully", "order_id": order.id})

# Get all orders for the logged-in user
@api_view(["GET"])
def user_orders(request):
    user = request.user
    orders = Order.objects.filter(user=user).order_by('-created_at')
    serializer = OrderSerializer(orders, many=True)
    return Response(serializer.data)




# This is for admin 

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def current_user(request):
    serializer = UserSerializer(request.user)
    return Response(serializer.data)


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def orders_by_status(request, status=None):
    """
    Fetch orders by status. If no status provided, fetch all orders.
    """
    valid_statuses = ["pending", "preparing", "delivered"]

    if status and status not in valid_statuses:
        return Response({"error": "Invalid status"}, status=400)

    if status:
        orders = Order.objects.filter(status=status)
    else:
        orders = Order.objects.all()

    serializer = OrderSerializer(orders, many=True)
    return Response(serializer.data)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def move_order(request, status, order_id):
    order = get_object_or_404(Order, id=order_id)
    order.status = status
    order.save()
    return Response({"message": f"Order {order.id} moved to {status}"})