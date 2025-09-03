"use client"

import { useSelector, useDispatch } from "react-redux"
import { removeFromCart } from "@/features/cartSlice"
import CustomerShippingForm from "@/components/checkout/CustomerShippingForm"
import PaymentTypeSelector from "@/components/checkout/PaymentTypeSelector"
import CartSummary from "@/components/checkout/CartSummary"
import { useState, useRef, useEffect } from "react"   // <-- yahan add karo
import { useTrackActivityMutation } from "@/features/trackActivityApi";
export default function CheckoutPage() {
  const dispatch = useDispatch()
  const [trackActivity] = useTrackActivityMutation();
  const hasTracked = useRef(false); // guard flag
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
useEffect(() => {
    if (hasTracked.current) return; 
    hasTracked.current = true;

    async function logActivity() {
      try {
        const ip = await fetch("https://api.ipify.org?format=json")
          .then((res) => res.json())
          .then((data) => data.ip);

        await trackActivity({
          page_name: "Check-out",
          ip_address: ip,
        });
      } catch (error) {
        console.error("Tracking failed", error);
      }
    }

    logActivity();
  }, [trackActivity]);
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
