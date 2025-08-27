"use client"

import { useState, useEffect } from "react"
import { X, Mail, CheckCircle, Sparkles } from "lucide-react"
import axios from "axios"

export default function EmailPopup({ isOpen, setIsOpen, productId, variationId }) {
  const [email, setEmail] = useState("")
  const [isSubmitted, setIsSubmitted] = useState(false)
  const [isLoading, setIsLoading] = useState(false)
  const [notificationAdded, setNotificationAdded] = useState(false)

  const handleAddNotification = async (e) => {
    e.preventDefault()
    setIsLoading(true)

    try {
      const response = await axios.post(`${process.env.NEXT_PUBLIC_BASE_URL}/notify-email`, {
        email,
        product_id: productId,
        variation_id: variationId,
      })

      console.log("Notification added:", response.data)
      setIsSubmitted(true)
      setNotificationAdded(true)

      // Auto-close popup after success
      setTimeout(() => {
        setIsOpen(false)
        setIsSubmitted(false)
        setEmail("")
        setNotificationAdded(false)
      }, 2000)
    } catch (error) {
      console.error("Error adding notification:", error)
      alert("Failed to subscribe. Please try again.")
    } finally {
      setIsLoading(false)
    }
  }

  // Reset states when popup closes
  useEffect(() => {
    if (!isOpen) {
      setIsSubmitted(false)
      setEmail("")
      setIsLoading(false)
      setNotificationAdded(false)
    }
  }, [isOpen])

  if (!isOpen) return null

  return (
    <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 p-4 animate-in fade-in duration-300">
      <div className="bg-white dark:bg-gray-900 rounded-2xl shadow-2xl w-full max-w-md relative transform animate-in zoom-in-95 duration-300 border border-gray-200 dark:border-gray-700">
        {/* Close button */}
        <button
          onClick={() => setIsOpen(false)}
          className="absolute top-4 right-4 p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 transition-all duration-200 hover:scale-110 active:scale-95 group"
          aria-label="Close popup"
        >
          <X
            size={20}
            className="text-gray-500 group-hover:text-gray-700 dark:text-gray-400 dark:group-hover:text-gray-200"
          />
        </button>

        <div className="p-8">
          {!isSubmitted ? (
            <>
              {/* Header */}
              <div className="text-center mb-6">
                <div className="inline-flex items-center justify-center w-16 h-16 bg-yellow-100 dark:bg-yellow-900/30 rounded-full mb-4">
                  <Mail className="w-8 h-8 text-yellow-600 dark:text-yellow-400" />
                </div>
                <h3 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">Get Notified</h3>
                <p className="text-gray-600 dark:text-gray-300 text-sm">
                  We'll let you know when this item is back in stock
                </p>
              </div>

              {/* Form */}
              <form onSubmit={handleAddNotification} className="space-y-4">
                <div className="relative">
                  <input
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="Enter your email address"
                    required
                    className="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-xl focus:outline-none focus:ring-2 focus:ring-yellow-400 focus:border-transparent transition-all duration-200 bg-white dark:bg-gray-800 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400"
                  />
                  <div className="absolute inset-y-0 right-0 flex items-center pr-3">
                    <Mail className="w-5 h-5 text-gray-400" />
                  </div>
                </div>

                <button
                  type="submit"
                  disabled={isLoading}
                  className="w-full bg-yellow-400 hover:bg-yellow-500 disabled:bg-yellow-300 text-black font-semibold py-3 px-6 rounded-xl transition-all duration-200 hover:scale-[1.02] active:scale-[0.98] disabled:cursor-not-allowed disabled:hover:scale-100 flex items-center justify-center gap-2"
                >
                  {isLoading ? (
                    <>
                      <div className="w-5 h-5 border-2 border-black/20 border-t-black rounded-full animate-spin"></div>
                      Subscribing...
                    </>
                  ) : (
                    <>
                      <Sparkles className="w-5 h-5" />
                      Notify Me
                    </>
                  )}
                </button>
              </form>

              <p className="text-xs text-gray-500 dark:text-gray-400 text-center mt-4">
                We respect your privacy. Unsubscribe at any time.
              </p>
            </>
          ) : (
            /* Success state */
            <div className="text-center py-4">
              <div className="inline-flex items-center justify-center w-16 h-16 bg-green-100 dark:bg-green-900/30 rounded-full mb-4 animate-in zoom-in duration-500">
                <CheckCircle className="w-8 h-8 text-green-600 dark:text-green-400" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">You're All Set!</h3>
              <p className="text-gray-600 dark:text-gray-300 text-sm">
                We'll notify you as soon as this item is available
              </p>
              <div className="mt-4 p-3 bg-yellow-50 dark:bg-yellow-900/20 rounded-lg border border-yellow-200 dark:border-yellow-800">
                <p className="text-sm text-yellow-800 dark:text-yellow-200 font-medium">{email}</p>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
