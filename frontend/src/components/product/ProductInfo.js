"use client"

import { useState } from "react"

export default function ProductInfo({ product, variation }) {
    const [quantity, setQuantity] = useState(1)
    const [selectedSize, setSelectedSize] = useState(product.sizes?.[0])

    const discountPercent = Math.round(((product.originalPrice - product.price) / product.originalPrice) * 100)

    return (
        <div className="space-y-6">
            {/* Product Title */}
            <div>
                <h1 className="text-3xl font-bold text-gray-900">{product.title}</h1>
                <p className="text-gray-600 mt-2">{product.brand}</p>
            </div>

            {/* Rating */}
            <div className="flex items-center space-x-2">
                <div className="flex text-yellow-400">
                    {[...Array(5)].map((_, i) => (
                        <span key={i} className={i < Math.floor(product.rating) ? "text-yellow-400" : "text-gray-300"}>
                            ⭐
                        </span>
                    ))}
                </div>
                <span className="text-gray-600">({product.reviews} reviews)</span>
            </div>

            {/* Price */}
            <div className="flex items-center space-x-3">
                <span className="text-3xl font-bold text-gray-900">${product.price}</span>
                {product.originalPrice > product.price && (
                    <>
                        <span className="text-xl text-gray-500 line-through">${product.originalPrice}</span>
                        <span className="bg-red-100 text-red-800 px-2 py-1 rounded text-sm font-medium">-{discountPercent}%</span>
                    </>
                )}
            </div>

            {/* Description */}
            <div>
                <h3 className="font-semibold text-gray-900 mb-2">Description</h3>
                <p className="text-gray-600 leading-relaxed">{product.description}</p>
            </div>

            {/* Size Selection */}
            {product.sizes && (
                <div>
                    <h3 className="font-semibold text-gray-900 mb-2">Size</h3>
                    <div className="flex space-x-2">
                        {product.sizes.map((size) => (
                            <button
                                key={size}
                                onClick={() => setSelectedSize(size)}
                                className={`px-4 py-2 border rounded-lg ${selectedSize === size
                                    ? "border-blue-500 bg-blue-50 text-blue-600"
                                    : "border-gray-300 text-gray-700 hover:border-gray-400"
                                    }`}
                            >
                                {size}
                            </button>
                        ))}
                    </div>
                </div>
            )}

            {/* Quantity */}
            <div>
                <h3 className="font-semibold text-gray-900 mb-2">Quantity</h3>
                <div className="flex items-center space-x-3">
                    <button
                        onClick={() => setQuantity(Math.max(1, quantity - 1))}
                        className="w-10 h-10 border border-gray-300 rounded-lg flex items-center justify-center hover:bg-gray-50"
                    >
                        -
                    </button>
                    <span className="text-lg font-medium w-12 text-center">{quantity}</span>
                    <button
                        onClick={() => setQuantity(quantity + 1)}
                        className="w-10 h-10 border border-gray-300 rounded-lg flex items-center justify-center hover:bg-gray-50"
                    >
                        +
                    </button>
                </div>
            </div>

            {/* Action Buttons */}
         <div className="space-y-3">
            <button
                className="w-full bg-black text-white py-3 rounded-lg font-medium transition-colors disabled:bg-gray-400 disabled:cursor-not-allowed cursor-pointer"
                disabled={
                    !variation || 
                    variation.length === 0 || 
                    variation.every(v => v.quantity === 0)
                }
            >
                Add to Cart
            </button>

            <button className="w-full border border-gray-300 text-gray-700 py-3 rounded-lg font-medium hover:bg-gray-50 transition-colors cursor-pointer">
                Add to Wishlist
            </button>

            </div>


         
        </div>
    )
}
