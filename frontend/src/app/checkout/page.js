"use client"

import { useSelector, useDispatch } from "react-redux"
import { removeFromCart } from "@/features/cartSlice"
import CustomerShippingForm from "@/components/checkout/CustomerShippingForm"
import PaymentTypeSelector from "@/components/checkout/PaymentTypeSelector"
import CartSummary from "@/components/checkout/CartSummary"
import { useState } from "react"

export default function CheckoutPage() {
  const dispatch = useDispatch()

  // ✅ Redux cart state
  const { cartItems, subtotal, deliveryCharges, total } = useSelector((state) => state.cart)

  // ✅ Local states for payment
  const [paymentType, setPaymentType] = useState("cash")
  const [onlineProvider, setOnlineProvider] = useState("")
  const [formData, setFormData] = useState({
    firstName: "", lastName: "", email: "", phone: "", address: "", city: "", zipCode: "",
    easypaisaNumber: "", jazzcashNumber: "", cnic: "", sadapayEmail: ""
  })

  // ✅ Redux remove item
  const removeItem = (id) => dispatch(removeFromCart(id))

  const handleInputChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value })
  }

  const handleSubmit = () => {
    if (paymentType === "cash") {
      alert("Order placed: Cash on Delivery 💰")
    } else if (paymentType === "online") {
      alert(`Order placed via ${onlineProvider.toUpperCase()} 💳`)
    }
  }

  return (
    <div className="min-h-screen bg-white text-black container mx-auto px-4 py-8 grid lg:grid-cols-2 gap-8">
      {/* Left */}
      <div className="space-y-6">
        <CustomerShippingForm 
          formData={formData} 
          handleInputChange={handleInputChange} 
        />
        
        <PaymentTypeSelector 
          paymentType={paymentType} 
          setPaymentType={setPaymentType}
          onlineProvider={onlineProvider}
          setOnlineProvider={setOnlineProvider}
          formData={formData} 
          handleInputChange={handleInputChange} 
        />
      </div>

      {/* Right */}
      <CartSummary 
        cartItems={cartItems} 
        removeItem={removeItem} 
        subtotal={subtotal} 
        deliveryCharges={deliveryCharges} 
        tax={subtotal * 0.1} 
        total={total + subtotal * 0.1} 
        paymentType={paymentType} 
        handleSubmit={handleSubmit} 
      />
    </div>
  )
}
