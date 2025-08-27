"use client"
import { useState, useEffect } from "react"
import { useDispatch } from "react-redux"
import { addToCart } from "@/features/cartSlice"
import { useCheckStockQuery } from "@/features/stockApi"
import EmailPopup from "./EmailPopup";
import toast from "react-hot-toast"
import axios from "axios"
import { Check, X, Bell, BellRing, Loader2 } from "lucide-react"

export default function ProductInfo({ product, variation }) {
  const dispatch = useDispatch()
  const [selectedVariation, setSelectedVariation] = useState(variation?.[0] || null)
  const [quantity, setQuantity] = useState(1)
  const [isOpen, setIsOpen] = useState(false)
  const [stockStatus, setStockStatus] = useState("idle") 
  const [notificationAdded, setNotificationAdded] = useState(false)
  const [isAddingNotification, setIsAddingNotification] = useState(false)

  const handleVariationChange = async (v) => {
    setSelectedVariation(v)
    setStockStatus("checking")

    try {
      const res = await axios.post(
        `${process.env.NEXT_PUBLIC_BASE_URL}/check-stock`,
        { variation_id: v.variation_id }
      )

      if (res.data?.status === true && res.data?.available_stock > 0) {
        setStockStatus("available")
      } else {
        setStockStatus("unavailable")
      }
    } catch (error) {
      console.error("Stock check failed:", error)
      setStockStatus("unavailable")
    }
  }

  const { data: stockData, isLoading } = useCheckStockQuery(
    {
      productId: product?.id,
      variationId: selectedVariation?.variation_id,
      quantity,
    },
    { skip: !selectedVariation }
  )

  useEffect(() => {
    if (variation && variation.length > 0) {
      setSelectedVariation(variation[0])
    }
  }, [variation])

  const variationPrice = selectedVariation?.price || product.price
  const originalPrice = product.originalPrice
  const discountPercent =
    originalPrice > variationPrice
      ? Math.round(((originalPrice - variationPrice) / originalPrice) * 100)
      : 0

  const handleAddToCart = () => {
    if (!selectedVariation) return toast.error("Select a variation first")
    if (isLoading) return toast.error("Checking stock...")

    if (stockData?.status === false) {
      return toast.error(stockData?.message || "Not enough stock available")
    }

    if (stockData?.available_stock !== undefined && stockData.available_stock < quantity) {
      return toast.error(`Only ${stockData.available_stock} items available in stock!`)
    }

    dispatch(
      addToCart({
        id: product.id,
        name: product.title,
        price: selectedVariation.price || product.price,
        image: selectedVariation.image || product.image,
        quantity: quantity,
        stock: stockData?.available_stock ?? selectedVariation.quantity,
        size: selectedVariation.value_title,
        variation_id: selectedVariation.variation_id,
      })
    )

    toast.success(`${product.title} (${selectedVariation.value_title}) added to cart!`)
  }

  const handleAddNotification = () => {
    setIsAddingNotification(true)
    setTimeout(() => {
      setIsAddingNotification(false)
      setNotificationAdded(true)
      setIsOpen(true) // Open EmailPopup
    }, 1500)
  }

  return (
    <div className="space-y-6">
    <EmailPopup
  isOpen={isOpen}
  setIsOpen={setIsOpen}
  productId={product.id}
  variationId={selectedVariation?.variation_id} 
/>

      {/* Product Title */}
      <div>
        <h1 className="text-3xl font-bold">{product.title}</h1>
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
        <span className="text-3xl font-bold">${variationPrice}</span>
        {originalPrice > variationPrice && (
          <>
            <span className="text-xl text-gray-500 line-through">${originalPrice}</span>
            <span className="bg-red-100 text-red-800 px-2 py-1 rounded text-sm font-medium">
              -{discountPercent}%
            </span>
          </>
        )}
      </div>

      {/* Description */}
      <div>
        <h3 className="font-semibold mb-2">Description</h3>
        <p className="text-gray-600 leading-relaxed">{product.description}</p>
      </div>

      {/* Variations */}
      {variation && variation.length > 0 ? (
        <div className="space-y-4">
          <h3 className="text-lg font-bold bg-gradient-to-r from-gray-900 to-gray-600 dark:from-white dark:to-gray-300 bg-clip-text text-transparent">
            Select {variation[0].attribute_title}
          </h3>

          <div className="flex flex-wrap gap-3">
            {variation.map((v) => (
              <button
                key={v.variation_id}
                onClick={() => handleVariationChange(v)}
                disabled={v.quantity === 0}
                className={`
                  relative px-6 py-3 rounded-xl font-medium transition-all duration-300 transform hover:scale-105 active:scale-95
                  ${
                    selectedVariation?.variation_id === v.variation_id
                      ? "bg-yellow-400 text-black border-2 border-yellow-500 shadow-lg shadow-yellow-400/25"
                      : v.quantity === 0
                        ? "bg-gray-100 dark:bg-gray-800 text-gray-400 border-2 border-gray-200 dark:border-gray-700 cursor-not-allowed"
                        : "bg-white dark:bg-gray-900 text-gray-700 dark:text-gray-300 border-2 border-gray-200 dark:border-gray-700 hover:border-yellow-400 hover:shadow-md"
                  }
                `}
              >
                {v.value_title}
                {v.quantity === 0 && (
                  <div className="absolute inset-0 flex items-center justify-center">
                    <div className="w-full h-0.5 bg-red-400 rotate-12 rounded-full"></div>
                  </div>
                )}
              </button>
            ))}
          </div>

          {/* Stock Status */}
          <div className="mt-6">
            {stockStatus === "checking" && (
              <div className="flex items-center space-x-3 p-4 bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-800 rounded-xl">
                <Loader2 className="w-5 h-5 text-blue-500 animate-spin" />
                <p className="text-blue-700 dark:text-blue-300 font-medium">Checking availability...</p>
              </div>
            )}
            {stockStatus === "available" && (
              <div className="flex items-center space-x-3 p-4 bg-green-50 dark:bg-green-900/20 border border-green-200 dark:border-green-800 rounded-xl">
                <div className="flex-shrink-0 w-8 h-8 bg-green-500 rounded-full flex items-center justify-center">
                  <Check className="w-5 h-5 text-white" />
                </div>
                <p className="text-green-700 dark:text-green-300 font-medium">In Stock & Ready to Ship!</p>
              </div>
            )}
            {stockStatus === "unavailable" && (
              <div className="space-y-4">
                <div className="flex items-center space-x-3 p-4 bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-800 rounded-xl">
                  <div className="flex-shrink-0 w-8 h-8 bg-red-500 rounded-full flex items-center justify-center">
                    <X className="w-5 h-5 text-white" />
                  </div>
                  <div>
                    <p className="text-red-700 dark:text-red-300 font-medium">Currently Out of Stock</p>
                    <p className="text-red-600 dark:text-red-400 text-sm">Get notified when it's back!</p>
                  </div>
                </div>

                {!notificationAdded ? (
                  <button
                    onClick={handleAddNotification}
                    disabled={isAddingNotification}
                    className="w-full flex items-center justify-center space-x-3 px-6 py-4 bg-gradient-to-r from-yellow-400 to-yellow-500 hover:from-yellow-500 hover:to-yellow-600 text-black font-semibold rounded-xl transition-all duration-300 transform hover:scale-105 active:scale-95 shadow-lg hover:shadow-xl disabled:opacity-70 disabled:cursor-not-allowed disabled:transform-none"
                  >
                    {isAddingNotification ? (
                      <>
                        <Loader2 className="w-5 h-5 animate-spin" />
                        <span>Adding Notification...</span>
                      </>
                    ) : (
                      <>
                        <Bell className="w-5 h-5" />
                        <span>Notify Me When Available</span>
                      </>
                    )}
                  </button>
                ) : (
                  <div className="flex items-center justify-center space-x-3 p-4 bg-green-50 dark:bg-green-900/20 border border-green-200 dark:border-green-800 rounded-xl">
                    <div className="flex-shrink-0 w-8 h-8 bg-green-500 rounded-full flex items-center justify-center">
                      <BellRing className="w-5 h-5 text-white" />
                    </div>
                    <div className="text-center">
                      <p className="text-green-700 dark:text-green-300 font-medium">Notification Added!</p>
                      <p className="text-green-600 dark:text-green-400 text-sm">
                        We'll email you when it's back in stock
                      </p>
                    </div>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      ) : (
        <div className="flex items-center justify-center space-x-3 p-6 bg-base-white dark:bg-base-black dark:text-base-white rounded-xl">
          <div className="flex-shrink-0 w-8 h-8 bg-red-500 rounded-full flex items-center justify-center">
            <X className="w-5 h-5 text-white" />
          </div>
          <p className="text-red-600 dark:text-red-400 font-medium text-lg">Product Out of Stock</p>
        </div>
      )}

      {/* Quantity */}
      <div>
        <h3 className="font-semibold mb-2">Quantity</h3>
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
          onClick={handleAddToCart}
          className="w-full bg-black text-white py-3 rounded-lg font-medium flex items-center justify-center
                                transition-colors disabled:bg-gray-400 disabled:cursor-not-allowed cursor-pointer"
          disabled={!selectedVariation || selectedVariation.quantity === 0 || isLoading || stockStatus === "unavailable"}
        >
          {isLoading ? (
            <svg
              className="animate-spin h-5 w-5 text-white"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
            >
              <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
              <path
                className="opacity-75"
                fill="currentColor"
                d="M4 12a8 8 0 018-8v4a4 4 0 00-4 4H4z"
              ></path>
            </svg>
          ) : (
            "Add to Cart"
          )}
        </button>
      </div>
    </div>
  )
}
