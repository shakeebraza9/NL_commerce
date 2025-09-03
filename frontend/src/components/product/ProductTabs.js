"use client"

import { useState } from "react"
import { useAddReviewMutation } from "@/features/reviewsSlice"
import toast from "react-hot-toast"
export default function ProductTabs({ productId, customerReviews = [] }) {
  const [activeTab, setActiveTab] = useState("reviews")
  const [showAll, setShowAll] = useState(false)
  const [reviews, setReviews] = useState(customerReviews)
  const [isFormOpen, setIsFormOpen] = useState(false)

  const [newReview, setNewReview] = useState({
    name: "",
    star: 0,
    review: "",
  })

  const [addReview, { isLoading }] = useAddReviewMutation()

  const tabs = [
    { id: "reviews", label: "Reviews" },
    { id: "shipping", label: "Shipping & Returns" },
  ]

  const visibleReviews = showAll ? reviews : reviews?.slice(0, 3)

const handleSubmit = async (e) => {
  e.preventDefault()
  if (!newReview.name || !newReview.star || !newReview.review) {
    toast.error("⚠️ Please fill all fields")
    return
  }

  try {
    const payload = {
      product_id: productId,
      name: newReview.name,
      review: newReview.review,
      star: newReview.star,
    }

    const response = await addReview(payload).unwrap()
    
    toast.success(response?.message || "Review submitted successfully ✅")
    setReviews([{ ...payload, id: Date.now(), created_at: new Date() }, ...reviews])
    setNewReview({ name: "", star: 0, review: "" })
    setShowAll(true)
    setIsFormOpen(false)
  } catch (error) {
    console.error("Failed to submit review", error)
    toast.error(error?.data?.message || "Something went wrong ❌")
  }
}


  return (
    <div className="bg-white border-t border-gray-200 pt-12">
      <div className=" px-6">
        <div className="flex border-b-2 border-gray-100 mb-8">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`px-8 py-4 font-semibold text-lg transition-all duration-300 border-b-3 ${
                activeTab === tab.id
                  ? "border-yellow-400 text-black bg-yellow-50"
                  : "border-transparent text-gray-600 hover:text-black hover:bg-gray-50"
              }`}
            >
              {tab.label}
            </button>
          ))}
        </div>

        {/* Tab Content */}
        <div className="pb-12">
          {activeTab === "reviews" && (
            <div className="space-y-8">
              <div className="flex items-center justify-between">
                <h3 className="text-2xl font-bold text-black">Customer Reviews</h3>
                <button
                  onClick={() => setIsFormOpen(!isFormOpen)}
                  className={`px-6 py-3 font-semibold rounded-lg transition-all duration-300 ${
                    isFormOpen
                      ? "bg-gray-100 text-black border-2 border-gray-300 hover:bg-gray-200"
                      : "bg-yellow-400 text-black hover:bg-yellow-500 shadow-lg hover:shadow-xl"
                  }`}
                >
                  {isFormOpen ? "Cancel" : "Write a Review"}
                </button>
              </div>

              {isFormOpen && (
                <div className="bg-white border-2 border-yellow-200 rounded-xl p-8 shadow-lg">
                  <h4 className="text-xl font-semibold text-black mb-6">Share Your Experience</h4>
                  <form onSubmit={handleSubmit} className="space-y-6">
                    <div>
                      <label className="block text-sm font-medium text-black mb-2">Your Name</label>
                      <input
                        type="text"
                        placeholder="Enter your name"
                        value={newReview.name}
                        onChange={(e) => setNewReview({ ...newReview, name: e.target.value })}
                        className="w-full border-2 border-gray-200 px-4 py-3 rounded-lg focus:outline-none focus:border-yellow-400 focus:ring-2 focus:ring-yellow-100 transition-all duration-300"
                      />
                    </div>

                    <div>
                      <label className="block text-sm font-medium text-black mb-2">Rating</label>
                      <div className="flex space-x-1">
                        {[1, 2, 3, 4, 5].map((star) => (
                          <button
                            key={star}
                            type="button"
                            onClick={() => setNewReview({ ...newReview, star })}
                            className={`text-3xl transition-all duration-200 hover:scale-110 ${
                              star <= newReview.star ? "text-yellow-400" : "text-gray-300 hover:text-yellow-200"
                            }`}
                          >
                            ★
                          </button>
                        ))}
                      </div>
                    </div>

                    <div>
                      <label className="block text-sm font-medium text-black mb-2">Your Review</label>
                      <textarea
                        placeholder="Tell us about your experience..."
                        value={newReview.review}
                        onChange={(e) => setNewReview({ ...newReview, review: e.target.value })}
                        className="w-full border-2 border-gray-200 px-4 py-3 rounded-lg focus:outline-none focus:border-yellow-400 focus:ring-2 focus:ring-yellow-100 transition-all duration-300 resize-none"
                        rows={4}
                      />
                    </div>

                    <button
                      type="submit"
                      className="w-full bg-yellow-400 text-black font-semibold py-4 rounded-lg hover:bg-yellow-500 transition-all duration-300 shadow-lg hover:shadow-xl"
                    >
                      Submit Review
                    </button>
                  </form>
                </div>
              )}

              <div className="space-y-6">
                {reviews?.length > 0 ? (
                  <>
                    {visibleReviews.map((review) => (
                      <div
                        key={review.id}
                        className="bg-white border border-gray-200 rounded-xl p-6 shadow-sm hover:shadow-md transition-all duration-300"
                      >
                        <div className="flex items-start justify-between mb-4">
                          <div className="flex items-center space-x-4">
                            <div className="w-12 h-12 bg-yellow-100 rounded-full flex items-center justify-center">
                              <span className="text-lg font-bold text-black">
                                {review.name.charAt(0).toUpperCase()}
                              </span>
                            </div>
                            <div>
                              <h4 className="font-semibold text-black text-lg">{review.name}</h4>
                              <div className="flex items-center space-x-1 mt-1">
                                {[...Array(5)].map((_, i) => (
                                  <span
                                    key={i}
                                    className={`text-lg ${i < review.star ? "text-yellow-400" : "text-gray-300"}`}
                                  >
                                    ★
                                  </span>
                                ))}
                              </div>
                            </div>
                          </div>
                          <span className="text-sm text-gray-500 bg-gray-50 px-3 py-1 rounded-full">
                            {new Date(review.created_at).toLocaleDateString()}
                          </span>
                        </div>
                        <p className="text-gray-700 leading-relaxed">{review.review}</p>
                      </div>
                    ))}

                    {!showAll && reviews.length > 3 && (
                      <div className="text-center pt-4">
                        <button
                          onClick={() => setShowAll(true)}
                          className="px-8 py-3 bg-white border-2 border-yellow-400 text-black font-semibold rounded-lg hover:bg-yellow-50 transition-all duration-300"
                        >
                          Load More Reviews ({reviews.length - 3} remaining)
                        </button>
                      </div>
                    )}
                  </>
                ) : (
                  <div className="text-center py-12 bg-gray-50 rounded-xl">
                    <p className="text-gray-500 text-lg">No reviews yet. Be the first to share your experience!</p>
                  </div>
                )}
              </div>
            </div>
          )}

          {activeTab === "shipping" && (
            <div className="space-y-8">
              <h3 className="text-2xl font-bold text-black">Shipping & Returns</h3>
              <div className="grid md:grid-cols-2 gap-6">
                <div className="bg-white border border-gray-200 rounded-xl p-6 shadow-sm">
                  <h4 className="text-lg font-semibold text-black mb-4 flex items-center">
                    <span className="w-2 h-2 bg-yellow-400 rounded-full mr-3"></span>
                    Shipping Options
                  </h4>
                  <div className="space-y-3 text-gray-700">
                    <p>
                      <strong className="text-black">Free Shipping:</strong> On orders over $50
                    </p>
                    <p>
                      <strong className="text-black">Standard Delivery:</strong> 3-5 business days
                    </p>
                    <p>
                      <strong className="text-black">Express Delivery:</strong> 1-2 business days
                    </p>
                  </div>
                </div>

                <div className="bg-white border border-gray-200 rounded-xl p-6 shadow-sm">
                  <h4 className="text-lg font-semibold text-black mb-4 flex items-center">
                    <span className="w-2 h-2 bg-yellow-400 rounded-full mr-3"></span>
                    Returns & Warranty
                  </h4>
                  <div className="space-y-3 text-gray-700">
                    <p>
                      <strong className="text-black">Returns:</strong> 30-day return policy
                    </p>
                    <p>
                      <strong className="text-black">Warranty:</strong> 1-year manufacturer warranty
                    </p>
                    <p>
                      <strong className="text-black">Support:</strong> 24/7 customer service
                    </p>
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}


