"use client"

import { Card, CardHeader, CardTitle, CardContent, Input, Label } from "../ui"
import { Crown } from "lucide-react"
import Image from "next/image"

export default function PaymentTypeSelector({ paymentType, setPaymentType, onlineProvider, setOnlineProvider, formData, handleInputChange }) {
  return (
    <div className="space-y-6">
      {/* Payment Type Selection */}
      <Card className="bg-gray-50 border-gray-300">
        <CardHeader>
          <CardTitle className="text-black flex items-center gap-2">
            <Crown className="h-5 w-5 text-yellow-500" />
            Payment Type
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="grid grid-cols-2 gap-4">
            <PaymentOption type="cash" selected={paymentType} setPaymentType={setPaymentType} label="Cash on Delivery" emoji="💰" desc="Pay when you receive" />
            <PaymentOption type="online" selected={paymentType} setPaymentType={setPaymentType} label="Online Payment" emoji="💳" desc="Pay now online" />
          </div>
        </CardContent>
      </Card>

      {/* Online Payment Providers */}
      {paymentType === "online" && (
        <Card className="bg-gray-50 border-gray-300">
          <CardHeader>
            <CardTitle className="text-black flex items-center gap-2">
              <Crown className="h-5 w-5 text-yellow-500" />
              Choose Online Provider
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="grid grid-cols-3 gap-4">
              <PaymentOption 
                type="easypaisa" 
                selected={onlineProvider} 
                setPaymentType={setOnlineProvider} 
                label="Easypaisa" 
                image="/payments/easypaisa.png" 
                desc="Mobile Wallet" 
              />
              <PaymentOption 
                type="jazzcash" 
                selected={onlineProvider} 
                setPaymentType={setOnlineProvider} 
                label="JazzCash" 
                image="/payments/jazzcash.png" 
                desc="Mobile Wallet" 
              />
              <PaymentOption 
                type="sadapay" 
                selected={onlineProvider} 
                setPaymentType={setOnlineProvider} 
                label="Sadapay" 
                image="/payments/sadapay.png" 
                desc="Digital Bank" 
              />
            </div>
          </CardContent>
        </Card>
      )}

      {/* Provider Specific Forms */}
      {paymentType === "online" && onlineProvider === "easypaisa" && (
        <Card className="bg-gray-50 border-gray-300">
          <CardHeader>
            <CardTitle className="text-black">Easypaisa Payment</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <InputField id="easypaisaNumber" label="Easypaisa Mobile Number" value={formData.easypaisaNumber} onChange={handleInputChange} />
          </CardContent>
        </Card>
      )}

      {paymentType === "online" && onlineProvider === "jazzcash" && (
        <Card className="bg-gray-50 border-gray-300">
          <CardHeader>
            <CardTitle className="text-black">JazzCash Payment</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <InputField id="jazzcashNumber" label="JazzCash Mobile Number" value={formData.jazzcashNumber} onChange={handleInputChange} />
            <InputField id="cnic" label="CNIC (Last 6 digits)" value={formData.cnic} onChange={handleInputChange} />
          </CardContent>
        </Card>
      )}

      {paymentType === "online" && onlineProvider === "sadapay" && (
        <Card className="bg-gray-50 border-gray-300">
          <CardHeader>
            <CardTitle className="text-black">Sadapay Payment</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <InputField id="sadapayEmail" label="Sadapay Email" value={formData.sadapayEmail} onChange={handleInputChange} />
          </CardContent>
        </Card>
      )}
    </div>
  )
}

/* Reusable Option Card */
function PaymentOption({ type, selected, setPaymentType, label, emoji, image, desc }) {
  return (
    <div
      className={`p-4 border-2 rounded-lg cursor-pointer transition-all ${
        selected === type ? "border-yellow-500 bg-yellow-50" : "border-gray-300 bg-white hover:border-yellow-300"
      }`}
      onClick={() => setPaymentType(type)}
    >
      <div className="text-center">
        {image ? (
          <Image src={image} alt={label} width={50} height={50} className="mx-auto mb-2" />
        ) : (
          <div className="text-2xl mb-2">{emoji}</div>
        )}
        <h3 className="font-semibold text-black">{label}</h3>
        <p className="text-sm text-gray-600">{desc}</p>
      </div>
    </div>
  )
}

/* Reusable Input */
function InputField({ id, label, value, onChange }) {
  return (
    <div>
      <Label htmlFor={id} className="text-black">{label}</Label>
      <Input
        id={id}
        name={id}
        value={value}
        onChange={onChange}
        className="bg-white border-gray-300 text-black focus:border-yellow-500"
      />
    </div>
  )
}
