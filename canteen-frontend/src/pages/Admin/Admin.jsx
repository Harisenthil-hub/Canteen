import './admin.css';
import { Header } from '../../components/Header';
import { useEffect, useState } from 'react';
import axios from 'axios';
import { OrdersSection } from './OrdersSection';
import { PreparingSection } from './PreparingSection';
import { DeliveredSection } from './DeliveredSection';


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



export function Admin() {

    const [activeTab, setActiveTab] = useState("pending");
    const [orders, setOrders] = useState([]);
    console.log(orders)

    useEffect(() => {

        const fetchOrders = async () => {
            try {
                const access = await getAccessToken(); // await the token
                const res = await axios.get(
                    `http://127.0.0.1:8000/api/orders/${activeTab}/`,
                    {
                        headers: {
                            Authorization: `Bearer ${access}`,
                        },
                    }
                );
                setOrders(res.data);
            } catch (err) {
                console.error("Error fetching orders:", err);
            }
        };

        fetchOrders();

    }, [activeTab]);




    const handleMoveOrders = async (orderId,newStatus) => {
        try {
            const access = await getAccessToken(); // your JWT token
            const res = await axios.post(
                `http://127.0.0.1:8000/api/orders/move/${newStatus}/${orderId}/`,
                {},
                {
                    headers: { Authorization: `Bearer ${access}` },
                }
            );
            alert(res.data.message);
    
            // Optionally, update local state so UI reflects the change
            setOrders((prevOrders) =>
                prevOrders.filter((order) => order.id !== orderId)
            );
        } catch (err) {
            console.error("Failed to move order:", err);
        }
    };

    console.log(activeTab)

    return (
        <>
            <Header />
            <header>Admin Order Management</header>

            <div className="tabs">
                <div
                    className={`tab ${activeTab === "pending" ? "active" : ""}`}
                    onClick={() => setActiveTab("pending")}>
                    Orders
                </div>
                <div
                    className={`tab ${activeTab === "preparing" ? "active" : ""}`}
                    onClick={() => setActiveTab("preparing")}>
                    Preparing
                </div>
                <div
                    className={`tab ${activeTab === "delivered" ? "active" : ""}`}
                    onClick={() => setActiveTab("delivered")}>
                    Delivered
                </div>
            </div>

            {activeTab === "pending" && <OrdersSection orders={orders} handleMoveOrders={handleMoveOrders} />}
            {activeTab === "preparing" && <PreparingSection orders={orders} handleMoveOrders={handleMoveOrders} />}
            {activeTab === "delivered" && <DeliveredSection orders={orders} />}




        </>
    )
}