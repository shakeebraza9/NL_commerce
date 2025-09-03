"use client"
import { useEffect, useRef } from "react";
import { useTrackActivityMutation } from "@/features/trackActivityApi";
import { useState } from "react"
import { Search, Package, Truck, CheckCircle, Clock, MapPin } from "lucide-react"

// Mock order data
const mockOrders = {
  ORD123456: {
    id: "ORD123456",
    status: "delivered",
    orderDate: "March 15, 2024",
    estimatedDelivery: "March 20, 2024",
    actualDelivery: "March 19, 2024",
    total: "149.99",
    shippingAddress: "123 Main St, New York, NY 10001",
    items: [
      { name: "Wireless Headphones", quantity: 1, price: "99.99" },
      { name: "Phone Case", quantity: 2, price: "25.00" },
      { name: "Shipping", quantity: 1, price: "25.00" },
    ],
    trackingSteps: [
      { status: "Order Placed", date: "Mar 15", time: "2:30 PM", completed: true },
      { status: "Payment Confirmed", date: "Mar 15", time: "2:35 PM", completed: true },
      { status: "Processing", date: "Mar 16", time: "9:00 AM", completed: true },
      { status: "Shipped", date: "Mar 17", time: "11:30 AM", completed: true },
      { status: "Out for Delivery", date: "Mar 19", time: "8:00 AM", completed: true },
      { status: "Delivered", date: "Mar 19", time: "3:45 PM", completed: true },
    ],
  },
  ORD789012: {
    id: "ORD789012",
    status: "shipped",
    orderDate: "March 18, 2024",
    estimatedDelivery: "March 25, 2024",
    total: "89.99",
    shippingAddress: "456 Oak Ave, Los Angeles, CA 90210",
    items: [
      { name: "Bluetooth Speaker", quantity: 1, price: "79.99" },
      { name: "Shipping", quantity: 1, price: "10.00" },
    ],
    trackingSteps: [
      { status: "Order Placed", date: "Mar 18", time: "4:15 PM", completed: true },
      { status: "Payment Confirmed", date: "Mar 18", time: "4:20 PM", completed: true },
      { status: "Processing", date: "Mar 19", time: "10:00 AM", completed: true },
      { status: "Shipped", date: "Mar 20", time: "2:15 PM", completed: true },
      { status: "Out for Delivery", date: "", time: "", completed: false },
      { status: "Delivered", date: "", time: "", completed: false },
    ],
  },
}

const getStatusColor = (status) => {
  switch (status) {
    case "delivered":
      return "bg-yellow-400 text-black font-semibold"
    case "shipped":
      return "bg-black text-yellow-400 font-semibold"
    case "processing":
      return "bg-yellow-500 text-black font-semibold"
    case "cancelled":
      return "bg-red-800 text-white font-semibold"
    default:
      return "bg-gray-600 text-white font-semibold"
  }
}

const getStatusIcon = (status) => {
  switch (status) {
    case "delivered":
      return <CheckCircle className="h-4 w-4" />
    case "shipped":
      return <Truck className="h-4 w-4" />
    case "processing":
      return <Package className="h-4 w-4" />
    default:
      return <Clock className="h-4 w-4" />
  }
}

export default function OrderTrackingPage() {
  const [trackingNumber, setTrackingNumber] = useState("")
  const [searchedOrder, setSearchedOrder] = useState(null)
  const [isSearching, setIsSearching] = useState(false)
  const [error, setError] = useState("")
  const [trackActivity] = useTrackActivityMutation();
  const hasTracked = useRef(false); 
  const handleSearch = () => {
    if (!trackingNumber.trim()) {
      setError("Please enter a tracking number")
      return
    }
    setIsSearching(true)
    setError("")
    setTimeout(() => {
      const order = mockOrders[trackingNumber.toUpperCase()]
      if (order) {
        setSearchedOrder(order)
        setError("")
      } else {
        setSearchedOrder(null)
        setError("Order not found. Please check your tracking number.")
      }
      setIsSearching(false)
    }, 500)
  }

  const handleKeyPress = (e) => {
    if (e.key === "Enter") handleSearch()
  }


    useEffect(() => {
    if (hasTracked.current) return; 
    hasTracked.current = true;

    async function logActivity() {
      try {
        const ip = await fetch("https://api.ipify.org?format=json")
          .then((res) => res.json())
          .then((data) => data.ip);

        await trackActivity({
          page_name: "Order-Tracking",
          ip_address: ip,
        });
      } catch (error) {
        console.error("Tracking failed", error);
      }
    }

    logActivity();
  }, [trackActivity]);

  return (
    <div className="min-h-screen bg-white">
      {/* Header */}
      <div className="border-b border-yellow-400 bg-black">
        <div className="max-w-4xl mx-auto px-4 py-8">
          <h1 className="text-4xl font-bold text-yellow-400 mb-2">Order Tracking</h1>
          <p className="text-white text-lg">Track your order status and delivery information</p>
        </div>
      </div>

      <div className="max-w-4xl mx-auto px-4 py-8 space-y-8">
        {/* Search Section */}
        <div className="bg-white p-8 rounded-xl shadow-lg border-2 border-yellow-400">
          <div className="flex items-center mb-3 text-black font-bold text-xl gap-3">
            <Search className="h-6 w-6 text-yellow-500" />
            Track Your Order
          </div>
          <p className="text-gray-700 mb-6 text-lg">Enter your order number to get real-time tracking information</p>

          <div className="flex gap-4">
            <input
              type="text"
              placeholder="Enter order number (e.g., ORD123456)"
              value={trackingNumber}
              onChange={(e) => setTrackingNumber(e.target.value)}
              onKeyPress={handleKeyPress}
              className="flex-1 border-2 border-gray-300 rounded-lg px-4 py-3 text-lg focus:outline-none focus:ring-2 focus:ring-yellow-400 focus:border-yellow-400"
            />
            <button
              onClick={handleSearch}
              disabled={isSearching}
              className="bg-yellow-400 text-black px-6 py-3 rounded-lg hover:bg-yellow-500 disabled:opacity-50 font-semibold text-lg transition-colors"
            >
              {isSearching ? "Searching..." : "Track Order"}
            </button>
          </div>
          {error && <p className="text-red-800 text-sm mt-3 font-medium">{error}</p>}
        </div>

        {/* Demo Orders */}
        <div className="bg-white p-8 rounded-xl shadow-lg border-2 border-yellow-400">
          <h3 className="text-xl font-bold mb-3 text-black">Demo Orders</h3>
          <p className="text-gray-700 mb-6 text-lg">Try these sample tracking numbers:</p>
          <div className="flex gap-4 flex-wrap">
            <button
              onClick={() => setTrackingNumber("ORD123456")}
              className="px-6 py-3 bg-black text-yellow-400 rounded-lg hover:bg-gray-800 font-semibold transition-colors"
            >
              ORD123456 (Delivered)
            </button>
            <button
              onClick={() => setTrackingNumber("ORD789012")}
              className="px-6 py-3 bg-black text-yellow-400 rounded-lg hover:bg-gray-800 font-semibold transition-colors"
            >
              ORD789012 (Shipped)
            </button>
          </div>
        </div>

        {/* Order Details */}
        {searchedOrder && (
          <div className="space-y-8">
            {/* Order Summary */}
            <div className="bg-white p-8 rounded-xl shadow-lg border-2 border-yellow-400 space-y-6">
              <div className="flex items-center justify-between flex-wrap gap-4">
                <div>
                  <h2 className="text-2xl font-bold text-black">Order #{searchedOrder.id}</h2>
                  <p className="text-gray-600 text-lg">Placed on {searchedOrder.orderDate}</p>
                </div>
                <div
                  className={`px-4 py-2 rounded-full text-lg flex items-center gap-2 ${getStatusColor(searchedOrder.status)}`}
                >
                  {getStatusIcon(searchedOrder.status)}
                  {searchedOrder.status.charAt(0).toUpperCase() + searchedOrder.status.slice(1)}
                </div>
              </div>
              <div className="grid md:grid-cols-2 gap-8">
                <div>
                  <h4 className="font-bold mb-4 text-black text-lg">Delivery Information</h4>
                  <div className="space-y-2">
                    <p className="text-gray-700">
                      <span className="font-semibold text-black">Estimated Delivery:</span>{" "}
                      {searchedOrder.estimatedDelivery}
                    </p>
                    {searchedOrder.actualDelivery && (
                      <p className="text-gray-700">
                        <span className="font-semibold text-black">Actual Delivery:</span>{" "}
                        {searchedOrder.actualDelivery}
                      </p>
                    )}
                    <div className="flex items-start gap-3 mt-4">
                      <MapPin className="h-5 w-5 text-yellow-500 mt-1" />
                      <span className="text-gray-700">{searchedOrder.shippingAddress}</span>
                    </div>
                  </div>
                </div>
                <div>
                  <h4 className="font-bold mb-4 text-black text-lg">Order Summary</h4>
                  <div className="space-y-3">
                    {searchedOrder.items.map((item, i) => (
                      <div key={i} className="flex justify-between text-gray-700">
                        <span>
                          {item.name} x{item.quantity}
                        </span>
                        <span className="font-semibold">${item.price}</span>
                      </div>
                    ))}
                    <div className="border-t-2 border-yellow-400 pt-3 flex justify-between font-bold text-lg bg-yellow-50 px-3 py-2 rounded">
                      <span className="text-black">Total</span>
                      <span className="text-black">${searchedOrder.total}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            {/* Tracking Timeline */}
            <div className="bg-white p-8 rounded-xl shadow-lg border-2 border-yellow-400 space-y-6">
              <h3 className="text-2xl font-bold mb-6 text-black">Tracking Timeline</h3>
              {searchedOrder.trackingSteps.map((step, i) => (
                <div key={i} className="flex items-start gap-6">
                  <div
                    className={`w-10 h-10 rounded-full flex items-center justify-center ${step.completed ? "bg-yellow-400 text-black" : "bg-gray-300 text-gray-600"}`}
                  >
                    {step.completed ? <CheckCircle className="h-5 w-5" /> : <Clock className="h-5 w-5" />}
                  </div>
                  <div className="flex-1">
                    <div className="flex items-center justify-between flex-wrap gap-2">
                      <h4 className={`font-semibold text-lg ${step.completed ? "text-black" : "text-gray-500"}`}>
                        {step.status}
                      </h4>
                      {step.date && (
                        <span className="text-gray-600 font-medium">
                          {step.date} {step.time}
                        </span>
                      )}
                    </div>
                    {i < searchedOrder.trackingSteps.length - 1 && (
                      <div className={`w-px h-8 ml-5 mt-3 ${step.completed ? "bg-yellow-400" : "bg-gray-300"}`} />
                    )}
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
