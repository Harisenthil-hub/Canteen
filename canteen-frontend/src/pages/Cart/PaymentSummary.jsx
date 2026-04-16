import { useNavigate } from "react-router-dom";

export function PaymentSummary({ cartData, setCartData, canteenId, getAccessToken }) {

    const navigate = useNavigate();
    const handlePlaceOrder = async () => {
        const token = await getAccessToken();
        try {
            const response = await fetch(`http://127.0.0.1:8000/api/place_order/${canteenId}/`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${token}`
                },
            });

            const data = await response.json();

            if (response.ok) {
                alert("Order placed successfully!");
                setCartData({ items: [], total_price: 0 }); // clear cart state
                navigate("/orders"); // redirect to Orders page
            } else {
                alert(data.error);
            }
        } catch (err) {
            console.error(err);
            alert("Something went wrong!");
        }
    };
    return (
        <>
            <div className="cart-summary">
                <h3>Order Summary</h3>

                {
                    cartData.items && cartData.items.map((item) => {
                        return (
                            <div className="summary-item" key={item.product_id}>
                                <span>{item.product_name} (x{item.quantity})</span>
                                <span>₹ {item.total.toFixed(2)}</span>
                            </div>
                        )
                    })
                }

                <hr />


                <div className="summary-row">
                    <span>Subtotal</span>
                    <span>₹ {(cartData?.total_price || 0).toFixed(2)}</span>
                </div>

                <div className="summary-row">
                    <span>Delivery</span>
                    <span>₹ 0.00</span>
                </div>

                <div className="summary-row total">
                    <span>Total</span>
                    <span>₹ {(cartData?.total_price || 0).toFixed(2)}</span>
                </div>

                <button className="checkout-btn" id="checkoutBtn" onClick={handlePlaceOrder}>Proceed to Checkout</button>
            </div>
        </>

    )
}