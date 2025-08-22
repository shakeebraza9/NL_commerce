"use client"

import { useState } from "react"

export default function ProductImages({ images, productName }) {
  const [selectedImage, setSelectedImage] = useState(0)
  const [isFullscreen, setIsFullscreen] = useState(false)

  return (
    <div className="space-y-4">
      {/* Main Image */}
      <div className="relative aspect-square bg-gray-100 rounded-xl overflow-hidden group shadow-lg">
        <img
          src={images[selectedImage] || "/placeholder.svg?height=500&width=500&query=product image"}
          alt={productName}
          className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-110 cursor-zoom-in"
          onClick={() => setIsFullscreen(true)}
        />

        <button
          onClick={() => setIsFullscreen(true)}
          className="absolute top-4 right-4 bg-black/70 hover:bg-yellow-400 text-white p-2 rounded-full transition-all duration-200 opacity-0 group-hover:opacity-100"
          aria-label="View fullscreen"
        >
          <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M4 8V4m0 0h4M4 4l5 5m11-1V4m0 0h-4m4 0l-5 5M4 16v4m0 0h4m-4 0l5-5m11 5l-5-5m5 5v-4m0 4h-4"
            />
          </svg>
        </button>
      </div>

      {/* Thumbnail Images */}
      <div className="flex space-x-3 overflow-x-auto pb-2">
        {images.map((image, index) => (
          <button
            key={index}
            onClick={() => setSelectedImage(index)}
            className={`flex-shrink-0 w-20 h-20 rounded-lg overflow-hidden border-2 transition-all duration-200 hover:scale-105 ${
              selectedImage === index
                ? "border-yellow-400 shadow-lg shadow-yellow-400/25"
                : "border-gray-200 hover:border-gray-400"
            }`}
          >
            <img
              src={image || "/placeholder.svg?height=80&width=80&query=product thumbnail"}
              alt={`${productName} ${index + 1}`}
              className="w-full h-full object-cover"
            />
          </button>
        ))}
      </div>

      {isFullscreen && (
        <div className="fixed inset-0 bg-black/90 z-50 flex items-center justify-center p-4">
          <div className="relative max-w-4xl max-h-full">
            <img
              src={images[selectedImage] || "/placeholder.svg?height=800&width=800&query=product fullscreen"}
              alt={productName}
              className="max-w-full max-h-full object-contain rounded-lg"
            />

            {/* Close button */}
            <button
              onClick={() => setIsFullscreen(false)}
              className="absolute top-4 right-4 bg-white/20 hover:bg-yellow-400 text-white p-2 rounded-full transition-all duration-200"
              aria-label="Close fullscreen"
            >
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>

            {/* Navigation arrows */}
            {images.length > 1 && (
              <>
                <button
                  onClick={() => setSelectedImage(selectedImage > 0 ? selectedImage - 1 : images.length - 1)}
                  className="absolute left-4 top-1/2 -translate-y-1/2 bg-white/20 hover:bg-yellow-400 text-white p-3 rounded-full transition-all duration-200"
                  aria-label="Previous image"
                >
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
                  </svg>
                </button>

                <button
                  onClick={() => setSelectedImage(selectedImage < images.length - 1 ? selectedImage + 1 : 0)}
                  className="absolute right-4 top-1/2 -translate-y-1/2 bg-white/20 hover:bg-yellow-400 text-white p-3 rounded-full transition-all duration-200"
                  aria-label="Next image"
                >
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                  </svg>
                </button>
              </>
            )}
          </div>
        </div>
      )}
    </div>
  )
}
