"use client"

import { useState } from "react"

export default function ProductImages({ images, productName }) {
    const [selectedImage, setSelectedImage] = useState(0)

    return (
        <div className="space-y-4">
            {/* Main Image */}
            <div className="aspect-square bg-gray-100 rounded-lg overflow-hidden">
                <img
                    src={images[selectedImage] || "/placeholder.svg"}
                    alt={productName}
                    className="w-full h-full object-cover"
                />
            </div>

            {/* Thumbnail Images */}
            <div className="flex space-x-2 overflow-x-auto">
                {images.map((image, index) => (
                    <button
                        key={index}
                        onClick={() => setSelectedImage(index)}
                        className={`flex-shrink-0 w-20 h-20 rounded-lg overflow-hidden border-2 ${selectedImage === index ? "border-blue-500" : "border-gray-200"
                            }`}
                    >
                        <img
                            src={image || "/placeholder.svg"}
                            alt={`${productName} ${index + 1}`}
                            className="w-full h-full object-cover"
                        />
                    </button>
                ))}
            </div>
        </div>
    )
}
