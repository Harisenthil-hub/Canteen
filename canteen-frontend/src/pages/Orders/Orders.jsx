import { Header } from "../../components/Header";
import { OrderCard } from "./OrderCard";
import "./orders.css";
import { useState, useEffect } from "react";


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




export function Orders() {
    const [orders, setOrders] = useState([]);
    const [selectedOrder, setSelectedOrder] = useState(null);


    const openModal = (order) => {
        setSelectedOrder(order)
    }

    const closeModal = () => {
        setSelectedOrder(null);
    }

    useEffect(() => {
        const fetchOrders = async () => {
            const access = await getAccessToken();
            try {
                const res = await fetch("http://127.0.0.1:8000/api/orders/", {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": `Bearer ${access}`
                    },

                });
                if (!res.ok) throw new Error("Failed to fetch orders");
                const data = await res.json();
                setOrders(data);
            } catch (error) {
                console.error(error);
                setOrders([]);
            }
        };

        fetchOrders();
    }, []);


    return (
        <>
            <title>Orders</title>
            <Header />
            <section className="orders-page">
                <h2>Your Orders</h2>

                <div className="orders-grid">
                    <OrderCard orders={orders} openModal={openModal} />

                </div>
            </section>




            {
                selectedOrder &&
                <div id="orderModal" className="modal">
                    <div className="modal-content">
                        <span className="close" onClick={closeModal}>&times;</span>
                        <h3>Order Details</h3>
                        <div id="order-details">
                            {selectedOrder && selectedOrder.items.map((item, id) => {
                                return (
                                    <p key={id}><span>{item.product_name} x{item.quantity}</span><span>₹  {(item.product_price * item.quantity).toFixed(2)}</span></p>
                                )
                            })}


                            <hr />
                            <p><strong>Total</strong><span>₹  {selectedOrder.total_price.toFixed(2)}</span></p>
                        </div>
                        <button className="reorder-btn-modal">Reorder</button>
                    </div>
                </div>
            }



        </>
    )
}