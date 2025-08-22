"use client"

import { useState } from "react"

export default function ProductTabs({ product }) {
    const [activeTab, setActiveTab] = useState("specifications")

    const tabs = [
        { id: "specifications", label: "Specifications" },
        { id: "reviews", label: "Reviews" },
        { id: "shipping", label: "Shipping & Returns" },
    ]

    return (
        <div className="border-t pt-8">
            {/* Tab Navigation */}
            <div className="flex border-b">
                {tabs.map((tab) => (
                    <button
                        key={tab.id}
                        onClick={() => setActiveTab(tab.id)}
                        className={`px-6 py-3 font-medium border-b-2 transition-colors ${activeTab === tab.id ? "border-black text-black" : "border-transparent text-gray-500 hover:text-gray-700"
                            }`}
                    >
                        {tab.label}
                    </button>
                ))}
            </div>

            {/* Tab Content */}
            <div className="py-6">
                {activeTab === "specifications" && (
                    <div className="space-y-4">
                        <h3 className="font-semibold text-lg">Product Specifications</h3>
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            {product.specifications?.map((spec, index) => (
                                <div key={index} className="flex justify-between py-2 border-b border-gray-100">
                                    <span className="text-gray-600">{spec.label}</span>
                                    <span className="font-medium">{spec.value}</span>
                                </div>
                            ))}
                        </div>
                    </div>
                )}

                {activeTab === "reviews" && (
                    <div className="space-y-6">
                        <h3 className="font-semibold text-lg">Customer Reviews</h3>
                        <div className="space-y-4">
                            {product.customerReviews?.map((review, index) => (
                                <div key={index} className="border-b border-gray-100 pb-4">
                                    <div className="flex items-center justify-between mb-2">
                                        <div className="flex items-center space-x-2">
                                            <span className="font-medium">{review.name}</span>
                                            <div className="flex text-yellow-400">
                                                {[...Array(5)].map((_, i) => (
                                                    <span key={i} className={i < review.rating ? "text-yellow-400" : "text-gray-300"}>
                                                        ⭐
                                                    </span>
                                                ))}
                                            </div>
                                        </div>
                                        <span className="text-sm text-gray-500">{review.date}</span>
                                    </div>
                                    <p className="text-gray-600">{review.comment}</p>
                                </div>
                            ))}
                        </div>
                    </div>
                )}

                {activeTab === "shipping" && (
                    <div className="space-y-4">
                        <h3 className="font-semibold text-lg">Shipping & Returns</h3>
                        <div className="space-y-3 text-gray-600">
                            <p>
                                <strong>Free Shipping:</strong> On orders over $50
                            </p>
                            <p>
                                <strong>Standard Delivery:</strong> 3-5 business days
                            </p>
                            <p>
                                <strong>Express Delivery:</strong> 1-2 business days
                            </p>
                            <p>
                                <strong>Returns:</strong> 30-day return policy
                            </p>
                            <p>
                                <strong>Warranty:</strong> 1-year manufacturer warranty
                            </p>
                        </div>
                    </div>
                )}
            </div>
        </div>
    )
}
