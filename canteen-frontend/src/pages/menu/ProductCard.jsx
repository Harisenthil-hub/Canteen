import axios from "axios";
import { useState } from "react";



async function getAccessToken() {
    let access = localStorage.getItem("access");
    const refresh = localStorage.getItem("refresh");

    if (!access || isExpired(access)) {
        const res = await fetch("http://127.0.0.1:8000/api/token/refresh/", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ refresh }),
        });

        if (res.ok) {
            const data = await res.json();
            localStorage.setItem("access", data.access);
            access = data.access;
        } else {
            localStorage.clear();
            throw new Error("Session expired. Please log in again.");
        }
    }

    return access;
}

function isExpired(token) {
    try {
        const [, payload] = token.split(".");
        const decoded = JSON.parse(atob(payload));
        return decoded.exp * 1000 < Date.now();
    } catch {
        return true;
    }
}



export function ProductCard({ menu, canteenId, selectedType }) {


    const [quantity, setQuantity] = useState({});
    // console.log(quantity)

    const handleAddToCart = async (product) => {
        const access = await getAccessToken();
        const itemQuantity = quantity[product.id] || 1;
        // console.log(product)
        // console.log(itemQuantity)
        console.log(product)
        try {
            await axios.post(
                `http://127.0.0.1:8000/api/cart/add/${canteenId}/${Number(product.product_id)}`,
                { product_id: product.product_code, quantity: itemQuantity },
                { headers: { Authorization: `Bearer ${access}` } }
            );
            alert("Added to cart!");
            // console.log(res)
        } catch (err) {
            console.error(err);
        }
    };

    const filteredMenu = selectedType === "All" ? menu : menu.filter(item => item.product_type === selectedType);


    const handleIncrease = (id) => {
        setQuantity((prev) => ({
            ...prev,
            [id]: (prev[id] || 1) + 1,
        }));
    };

    const handleDecrease = (id) => {
        setQuantity((prev) => ({
            ...prev,
            [id]: Math.max(1, (prev[id] || 1) - 1),
        }));
    };


    



    return (

        <>
            {
                filteredMenu.map((item) => {
                    return (
                        <div className="product-card" key={item.id}>
                            <div className="img-container">
                                <img src={item.product_url} alt="Burger"
                                    className="product-img" />
                                <span className="stock-badge">Only {item.stock} left</span>
                            </div>

                            <div className="product-info">
                                <h3 className="product-title">{item.product_name}</h3>
                                {/* <p className="product-desc">Juicy grilled beef patty with melted cheese.</p> */}
                                <div className="price">₹ {Number(item.product_price).toFixed(2)}</div>
                                <div className="qty-editor">
                                    <button className="qty-btn" onClick={() => handleDecrease(item.id)}>-</button>
                                    <span className="qty-value">{quantity[item.id] || 1}</span>
                                    <button className="qty-btn" onClick={() => handleIncrease(item.id)}>+</button>
                                </div>

                                <button className="add-btn" onClick={() => handleAddToCart(item)}>Add to Cart</button>
                            </div>
                        </div>

                    )

                })
            }
        </>

    );
};

export default ProductCard;