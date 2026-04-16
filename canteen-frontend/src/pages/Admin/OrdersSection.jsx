

export function OrdersSection({ orders, handleMoveOrders }) {
    return (
        <div className="section active" id="orders">
            <div className="order-board">
                {orders &&
                    orders.map((item) => {
                        return (
                            <div className="order-card" key={item.id}>
                                <strong>Order #{item.id}</strong>
                                <p className='canteen-name'>{item.canteen_name}</p>
                                <p className='items'>
                                    {item.items.map((item) => {
                                        return (`${item.product_name} x${item.quantity}`)
                                    }).join(", ")
                                    }
                                </p>
                                <button 
                                    className="btn btn-move" 
                                    onClick={()=> handleMoveOrders(item.id,"preparing")}>
                                        Move to Preparing
                                </button>
                            </div>
                        )
                    })
                }

            </div>
        </div>
    )
}