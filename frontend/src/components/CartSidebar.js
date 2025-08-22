"use client"

import { X, Plus, Minus, ShoppingBag, Trash2 } from "lucide-react"
import Link from "next/link"

export default function CartSidebar({ cartOpen, setCartOpen, cartItems = [] }) {
    const sampleCartItems =
        cartItems.length > 0
            ? cartItems
            : [
                {
                    id: 1,
                    name: "Shalwar kameez for woman",
                    price: 299,
                    qty: 1,
                    image: "/images/dress4.png",
                    color: "Black",
                },
                {
                    id: 2,
                    name: "Casual Summer Dress",
                    price: 199,
                    qty: 2,
                    image: "/images/dress2.png",
                    color: "Silver",
                },
            ]

    const subtotal = sampleCartItems.reduce((total, item) => total + item.price * item.qty, 0)
    const shipping = subtotal > 500 ? 0 : 25
    const total = subtotal + shipping

    return (
        <>
            <div
                className={`fixed top-0 right-0 h-full w-96 bg-white shadow-2xl transform transition-all duration-300 z-50 flex flex-col ${cartOpen ? "translate-x-0" : "translate-x-full"
                    }`}
            >
                <div className="flex justify-between items-center p-6 border-b border-gray-100">
                    <div className="flex items-center gap-3">
                        <ShoppingBag className="w-6 h-6 text-gray-700" />
                        <div>
                            <h2 className="text-xl font-bold text-gray-900">Shopping Cart</h2>
                            <p className="text-sm text-gray-500">{sampleCartItems.length} items</p>
                        </div>
                    </div>
                    <button onClick={() => setCartOpen(false)} className="p-2 hover:bg-gray-100 rounded-full transition-colors">
                        <X size={20} className="text-gray-600" />
                    </button>
                </div>

                <div className="flex-1 overflow-y-auto p-6">
                    {sampleCartItems.length === 0 ? (
                        <div className="flex flex-col items-center justify-center h-full text-center">
                            <ShoppingBag className="w-16 h-16 text-gray-300 mb-4" />
                            <h3 className="text-lg font-semibold text-gray-900 mb-2">Your cart is empty</h3>
                            <p className="text-gray-500 mb-6">Add some products to get started</p>
                            <button
                                onClick={() => setCartOpen(false)}
                                className="bg-black text-white px-6 py-3 rounded-lg hover:bg-gray-800 transition-colors"
                            >
                                Continue Shopping
                            </button>
                        </div>
                    ) : (
                        <div className="space-y-4">
                            {sampleCartItems.map((item) => (
                                <div key={item.id} className="bg-gray-50 rounded-xl p-4 hover:bg-gray-100 transition-colors">
                                    <div className="flex gap-4">
                                        <div className="w-20 h-20 bg-white rounded-lg overflow-hidden shadow-sm">
                                            <img
                                                src={item.image || "/placeholder.svg"}
                                                alt={item.name}
                                                className="w-full h-full object-cover"
                                            />
                                        </div>
                                        <div className="flex-1">
                                            <h3 className="font-semibold text-gray-900 mb-1">{item.name}</h3>
                                            <p className="text-sm text-gray-500 mb-2">Color: {item.color}</p>
                                            <div className="flex items-center justify-between">
                                                <div className="flex items-center gap-3">
                                                    <button className="w-8 h-8 rounded-full border border-gray-300 flex items-center justify-center hover:bg-gray-200 transition-colors">
                                                        <Minus size={14} />
                                                    </button>
                                                    <span className="font-semibold text-gray-900 min-w-[20px] text-center">{item.qty}</span>
                                                    <button className="w-8 h-8 rounded-full border border-gray-300 flex items-center justify-center hover:bg-gray-200 transition-colors">
                                                        <Plus size={14} />
                                                    </button>
                                                </div>
                                                <button className="p-2 text-red-500 hover:bg-red-50 rounded-full transition-colors">
                                                    <Trash2 size={16} />
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="flex justify-between items-center mt-3 pt-3 border-t border-gray-200">
                                        <span className="text-sm text-gray-500">${item.price} each</span>
                                        <span className="font-bold text-lg text-gray-900">${item.qty * item.price}</span>
                                    </div>
                                </div>
                            ))}
                        </div>
                    )}
                </div>

                {sampleCartItems.length > 0 && (
                    <div className="border-t border-gray-100 p-6 bg-gray-50">
                        <div className="space-y-3 mb-6">
                            <div className="flex justify-between text-gray-600">
                                <span>Subtotal</span>
                                <span>${subtotal}</span>
                            </div>
                            <div className="flex justify-between text-gray-600">
                                <span>Shipping</span>
                                <span>{shipping === 0 ? "Free" : `$${shipping}`}</span>
                            </div>
                            {shipping === 0 && <p className="text-sm text-green-600">🎉 Free shipping on orders over $500!</p>}
                            <div className="flex justify-between text-lg font-bold text-gray-900 pt-3 border-t border-gray-200">
                                <span>Total</span>
                                <span>${total}</span>
                            </div>
                        </div>

                        <div className="space-y-3">
                            <button className="w-full bg-black text-white py-4 rounded-xl font-semibold hover:bg-gray-800 transition-colors">
                                Checkout Now
                            </button>
                            <Link
                                href="/cart"
                                onClick={() => setCartOpen(false)}
                                className="block w-full text-center py-3 border border-gray-300 rounded-xl font-semibold text-gray-700 hover:bg-gray-100 transition-colors"
                            >
                                View Full Cart
                            </Link>
                        </div>
                    </div>
                )}
            </div>

            {cartOpen && (
                <div
                    className="fixed inset-0 bg-black/40 backdrop-blur-sm z-40 transition-opacity duration-300"
                    onClick={() => setCartOpen(false)}
                ></div>
            )}
        </>
    )
}
