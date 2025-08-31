"use client"
import { useEffect } from "react"
import { useDispatch, useSelector } from "react-redux"
import { Card, CardHeader, CardTitle, CardContent, Separator, Badge, Button } from "../ui"
import { Crown, Star, Shield, Trash2 } from "lucide-react"
import { fetchSettings } from "@/features/settingsSlice"

export default function CartSummary({ cartItems, removeItem, subtotal, total, paymentType, handleSubmit }) {
  const dispatch = useDispatch()
  const { delivery_charges, tax, loading } = useSelector((state) => state.settings)

  useEffect(() => {
    dispatch(fetchSettings())
  }, [dispatch])

  return (
    <div className="space-y-6">
      {/* Cart Items */}
      <Card className="bg-gray-50 border-gray-300">
        <CardHeader>
          <CardTitle className="text-black flex items-center gap-2">
            <Star className="h-5 w-5 text-yellow-500" />
            Your VIP Cart
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          {cartItems.map((item) => (
            <div key={item.id} className="flex items-center gap-4 p-4 bg-white rounded-lg border border-gray-200">
              <img
                src={`${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.image}` || "/placeholder.svg"}
                alt={item.name}
                className="w-16 h-16 rounded-lg object-cover"
              />
              <div className="flex-1">
                <h3 className="text-black font-semibold">{item.name}</h3>
                <p className="text-yellow-600 font-bold">${item.price}</p>
                <p className="text-gray-600">Quantity: {item.quantity}</p>
              </div>
              <Button size="sm" variant="destructive" onClick={() => removeItem(item.id)}>
                <Trash2 className="h-4 w-4" />
              </Button>
            </div>
          ))}
        </CardContent>
      </Card>

      {/* Order Summary */}
      <Card className="bg-gray-50 border-gray-300">
        <CardHeader>
          <CardTitle className="text-black flex items-center gap-2">
            <Crown className="h-5 w-5 text-yellow-500" />
            Order Summary
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex justify-between text-black">
            <span>Subtotal:</span>
            <span>${subtotal?.toFixed(2) || "0.00"}</span>
          </div>
          <div className="flex justify-between text-black">
            <span>Delivery Charges:</span>
            <span>${(delivery_charges ?? 0).toFixed(2)}</span>
          </div>
          <div className="flex justify-between text-black">
            <span>Tax (10%):</span>
            <span>${(tax ?? 0).toFixed(2)}</span>
          </div>
          <Separator className="bg-gray-300" />
          <div className="flex justify-between text-xl font-bold text-black">
            <span>Final Total:</span>
            <span>${total?.toFixed(2) || "0.00"}</span>
          </div>
          <Badge className="w-full justify-center bg-yellow-400 text-black hover:bg-yellow-500">
            {paymentType === "cash" ? "CASH ON DELIVERY" : "VIP FREE SHIPPING INCLUDED"}
          </Badge>
        </CardContent>
      </Card>

      {/* Place Order Button */}
      <Button
        onClick={handleSubmit}
        className="w-full bg-yellow-400 text-black hover:bg-yellow-500 text-lg font-bold py-6"
      >
        <Crown className="h-5 w-5 mr-2" />
        COMPLETE VIP ORDER
      </Button>

      {/* Security Badge */}
      <div className="text-center text-gray-500 text-sm">
        <Shield className="h-4 w-4 inline mr-1" />
        Secured by 256-bit SSL encryption
      </div>
    </div>
  )
}
