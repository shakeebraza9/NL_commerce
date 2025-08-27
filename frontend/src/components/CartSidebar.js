"use client"

import { X, Plus, Minus, ShoppingBag, Trash2 } from "lucide-react"
import Link from "next/link"
import { useSelector, useDispatch } from "react-redux"
import { increaseQty, decreaseQty, removeFromCart } from "@/features/cartSlice"

export default function CartSidebar({ cartOpen, setCartOpen }) {
    const dispatch = useDispatch()
    const { cartItems, subtotal, deliveryCharges, total } = useSelector((state) => state.cart)

    return (
        <>
            <div
                className={`fixed top-0 right-0 h-full 
                w-full sm:w-80 lg:w-96
                bg-white shadow-2xl transform transition-all duration-300 z-50 flex flex-col 
                ${cartOpen ? "translate-x-0" : "translate-x-full"}`}
            >
                {/* Header */}
                <div className="flex justify-between items-center p-4 sm:p-6 border-b border-gray-100">
                    <div className="flex items-center gap-3">
                        <ShoppingBag className="w-6 h-6 text-gray-700" />
                        <div>
                            <h2 className="text-lg sm:text-xl font-bold text-gray-900">Shopping Cart</h2>
                            <p className="text-xs sm:text-sm text-gray-500">{cartItems.length} items</p>
                        </div>
                    </div>
                    <button
                        onClick={() => setCartOpen(false)}
                        className="p-2 hover:bg-gray-100 rounded-full transition-colors"
                    >
                        <X size={20} className="text-gray-600" />
                    </button>
                </div>

                {/* Body */}
                <div className="flex-1 overflow-y-auto p-4 sm:p-6">
                    {cartItems.length === 0 ? (
                        <div className="flex flex-col items-center justify-center h-full text-center">
                            <ShoppingBag className="w-14 h-14 sm:w-16 sm:h-16 text-gray-300 mb-4" />
                            <h3 className="text-base sm:text-lg font-semibold text-gray-900 mb-2">
                                Your cart is empty
                            </h3>
                            <p className="text-sm sm:text-base text-gray-500 mb-6">
                                Add some products to get started
                            </p>
                            <button
                                onClick={() => setCartOpen(false)}
                                className="bg-black text-white px-4 sm:px-6 py-2 sm:py-3 rounded-lg hover:bg-gray-800 transition-colors"
                            >
                                Continue Shopping
                            </button>
                        </div>
                    ) : (
                        <div className="space-y-4">
                            {cartItems.map((item) => (
                                <div
                                    key={item.id}
                                    className="bg-gray-50 rounded-xl p-3 sm:p-4 hover:bg-gray-100 transition-colors"
                                >
                                    <div className="flex gap-3 sm:gap-4">
                                        <div className="w-16 h-16 sm:w-20 sm:h-20 bg-white rounded-lg overflow-hidden shadow-sm">
                                            <img
                                                src={`${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.image}` || "/placeholder.svg"}
                                                alt={item.name}
                                                className="w-full h-full object-cover"
                                            />
                                        </div>
                                        <div className="flex-1">
                                            <h3 className="font-semibold text-gray-900 mb-1 text-sm sm:text-base">
                                                {item.name}
                                            </h3>
                                            <p className="text-xs sm:text-sm text-gray-500 mb-2">
                                                Size: {item.size || "-"}
                                            </p>
                                            <div className="flex items-center justify-between">
                                                <div className="flex items-center gap-2 sm:gap-3">
                                                    <button
                                                        onClick={() => dispatch(decreaseQty(item.id))}
                                                        className="w-7 h-7 sm:w-8 sm:h-8 rounded-full border border-gray-300 flex items-center justify-center hover:bg-gray-200 transition-colors"
                                                    >
                                                        <Minus size={12} />
                                                    </button>
                                                    <span className="font-semibold text-gray-900 min-w-[20px] text-center text-sm sm:text-base">
                                                        {item.quantity}
                                                    </span>
                                                    <button
                                                        onClick={() => dispatch(increaseQty(item.id))}
                                                        className="w-7 h-7 sm:w-8 sm:h-8 rounded-full border border-gray-300 flex items-center justify-center hover:bg-gray-200 transition-colors"
                                                    >
                                                        <Plus size={12} />
                                                    </button>
                                                </div>
                                                <button
                                                    onClick={() => dispatch(removeFromCart(item.id))}
                                                    className="p-1 sm:p-2 text-red-500 hover:bg-red-50 rounded-full transition-colors"
                                                >
                                                    <Trash2 size={14} />
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="flex justify-between items-center mt-2 sm:mt-3 pt-2 sm:pt-3 border-t border-gray-200">
                                        <span className="text-xs sm:text-sm text-gray-500">${item.price} each</span>
                                        <span className="font-bold text-base sm:text-lg text-gray-900">
                                            ${item.quantity * item.price}
                                        </span>
                                    </div>
                                </div>
                            ))}
                        </div>
                    )}
                </div>

                {/* Footer */}
                {cartItems.length > 0 && (
                    <div className="border-t border-gray-100 p-4 sm:p-6 bg-gray-50">
                        <div className="space-y-2 sm:space-y-3 mb-4 sm:mb-6">
                            <div className="flex justify-between text-gray-600 text-sm sm:text-base">
                                <span>Subtotal</span>
                                <span>${subtotal}</span>
                            </div>
                            <div className="flex justify-between text-gray-600 text-sm sm:text-base">
                                <span>Shipping</span>
                                <span>{deliveryCharges === 0 ? "Free" : `$${deliveryCharges}`}</span>
                            </div>
                            {deliveryCharges === 0 && (
                                <p className="text-xs sm:text-sm text-green-600">
                                    🎉 Free shipping on orders over $500!
                                </p>
                            )}
                            <div className="flex justify-between text-base sm:text-lg font-bold text-gray-900 pt-2 sm:pt-3 border-t border-gray-200">
                                <span>Total</span>
                                <span>${total}</span>
                            </div>
                        </div>

                        <div className="space-y-2 sm:space-y-3">
                            <button className="w-full bg-black text-white py-3 sm:py-4 rounded-xl font-semibold hover:bg-gray-800 transition-colors text-sm sm:text-base">
                                Checkout Now
                            </button>
                            <Link
                                href="/cart"
                                onClick={() => setCartOpen(false)}
                                className="block w-full text-center py-2 sm:py-3 border border-gray-300 rounded-xl font-semibold text-gray-700 hover:bg-gray-100 transition-colors text-sm sm:text-base"
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
