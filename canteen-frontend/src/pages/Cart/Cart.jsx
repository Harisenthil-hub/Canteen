import './cart.css';
import { Header } from '../../components/Header';
import { CartCard } from './CartCard';
import { PaymentSummary } from './PaymentSummary';
import { useParams } from 'react-router-dom';
import { useEffect, useState } from 'react';
import axios from 'axios';



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


export function Cart() {
    const { canteenId } = useParams();


    const [cartData, setCartData] = useState([])


    useEffect(() => {

        const getCartData = async () => {
            const access = await getAccessToken();
            const response = await axios.get(`http://127.0.0.1:8000/api/cart/view/${canteenId}`,
                { headers: { Authorization: `Bearer ${access}` } })
            setCartData(response.data)

        }
        getCartData()
    }, [canteenId]);


    return (
        <>
            <title>Cart</title>
            <Header />

            <section className="cart-section">
                <h2 className="cart-title">Your Cart</h2>
                <div className="cart-layout">
                    <div className="cart-row-container">
                        <CartCard canteenId={canteenId} cartData={cartData} setCartData={setCartData} />
                    
                    </div>

                    <PaymentSummary cartData={cartData} setCartData={setCartData} canteenId={canteenId} getAccessToken={getAccessToken} />

                    <div className="payment-modal" id="paymentModal">
                        <div className="payment-content">
                            <h3>Payment Process</h3>
                            <p>Please wait while we process your payment...</p>
                            <div className="loader"></div>
                            <button id="closePayment">Close</button>
                        </div>
                    </div>
                    


                </div>
            </section>

        </>
    )
}