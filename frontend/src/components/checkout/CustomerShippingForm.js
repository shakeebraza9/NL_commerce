"use client"

import { Card, CardHeader, CardTitle, CardContent, Input, Label } from "../ui"
import { Star, Shield } from "lucide-react"

export default function CustomerShippingForm({ formData, handleInputChange }) {
  return (
    <div className="space-y-6">
      {/* Customer Info */}
      <Card className="bg-gray-50 border-gray-300">
        <CardHeader>
          <CardTitle className="text-black flex items-center gap-2">
            <Star className="h-5 w-5 text-yellow-500" />
            Customer Information
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="grid grid-cols-2 gap-4">
            <InputField id="firstName" label="First Name" value={formData.firstName} onChange={handleInputChange} />
            <InputField id="lastName" label="Last Name" value={formData.lastName} onChange={handleInputChange} />
          </div>
          <InputField id="email" label="Email Address" value={formData.email} onChange={handleInputChange} />
          <InputField id="phone" label="Phone Number" value={formData.phone} onChange={handleInputChange} />
        </CardContent>
      </Card>

      {/* Shipping */}
      <Card className="bg-gray-50 border-gray-300">
        <CardHeader>
          <CardTitle className="text-black flex items-center gap-2">
            <Shield className="h-5 w-5 text-yellow-500" />
            Shipping Address
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <InputField id="address" label="Street Address" value={formData.address} onChange={handleInputChange} />
          <div className="grid grid-cols-2 gap-4">
            <InputField id="city" label="City" value={formData.city} onChange={handleInputChange} />
            <InputField id="zipCode" label="ZIP Code" value={formData.zipCode} onChange={handleInputChange} />
          </div>
        </CardContent>
      </Card>
    </div>
  )
}

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
