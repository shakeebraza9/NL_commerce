"use client"
import Link from "next/link"
import { useSelector, useDispatch } from "react-redux"
import { Card, CardHeader, CardTitle, CardContent, Button, Separator } from "../../components/ui"
import {
  removeFromCart,
  clearCart,
  increaseQty,
  decreaseQty,
} from "../../features/cartSlice"

export default function ShoppingCart() {
  const dispatch = useDispatch()

  // Redux state se cart data nikal rahe hain
  const { cartItems, subtotal, deliveryCharges, total } = useSelector((state) => state.cart)

  const tax = Math.round(subtotal * 0.18)
  const totalItems = cartItems.reduce((sum, item) => sum + item.quantity, 0)

  return (
    <div className="min-h-screen bg-white text-black p-4">
      <div className="max-w-6xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold mb-2">Shopping Cart</h1>
          <p className="text-gray-600">
            {totalItems} {totalItems === 1 ? "item" : "items"} in your cart
          </p>
        </div>

        {cartItems.length === 0 ? (
          <Card className="text-center py-12">
            <CardContent>
              <div className="text-6xl mb-4">🛒</div>
              <h2 className="text-2xl font-semibold mb-2">Your cart is empty</h2>
              <p className="text-gray-600 mb-6">Add some items to get started</p>
              <Button className="bg-blue-600 hover:bg-blue-700 text-white px-8 py-3">Continue Shopping</Button>
            </CardContent>
          </Card>
        ) : (
          <div className="grid lg:grid-cols-3 gap-8">
            {/* Cart Items */}
            <div className="lg:col-span-2 space-y-4">
              <div className="flex justify-between items-center mb-4">
                <h2 className="text-xl font-semibold">Cart Items</h2>
                <Button
                  onClick={() => dispatch(clearCart())}
                  className="bg-red-600 hover:bg-red-700 text-white px-4 py-2"
                >
                  Clear Cart
                </Button>
              </div>

              {cartItems.map((item) => (
                <Card key={item.id} className="p-4">
                  <div className="flex gap-4">
                    {/* Product Image */}
                    <div className="w-24 h-24 bg-gray-100 rounded-lg overflow-hidden flex-shrink-0">
                      <img
                        src={`${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.image}` || "/placeholder.svg"}
                        alt={item.name}
                        className="w-full h-full object-cover"
                      />
                    </div>

                    {/* Product Details */}
                    <div className="flex-1">
                      <div className="flex justify-between items-start mb-2">
                        <h3 className="font-semibold text-lg">{item.name}</h3>
                        <Button
                          onClick={() => dispatch(removeFromCart(item.id))}
                          className="bg-red-100 hover:bg-red-200 text-red-600 px-3 py-1 text-sm"
                        >
                          Remove
                        </Button>
                      </div>

                      <div className="text-sm text-gray-600 mb-2">
                        <span>Color: {item.color}</span> • <span>Size: {item.size}</span>
                      </div>

                      <div className="flex justify-between items-center">
                        <div className="text-xl font-bold text-green-600">
                          ₹{item.price.toLocaleString()}
                        </div>

                        {/* Quantity Controls */}
                        <div className="flex items-center gap-3">
                          <span className="text-sm text-gray-600">Qty:</span>
                          <div className="flex items-center border rounded-lg">
                            <Button
                              onClick={() => dispatch(decreaseQty(item.id))}
                              className="bg-gray-100 hover:bg-gray-200 text-black px-3 py-1 rounded-r-none"
                            >
                              -
                            </Button>
                            <span className="px-4 py-1 bg-white border-x">{item.quantity}</span>
                            <Button
                              onClick={() => dispatch(increaseQty(item.id))}
                              className="bg-gray-100 hover:bg-gray-200 text-black px-3 py-1 rounded-l-none"
                            >
                              +
                            </Button>
                          </div>
                        </div>
                      </div>

                      {/* Item Total */}
                      <div className="text-right mt-2">
                        <span className="text-sm text-gray-600">Total: </span>
                        <span className="font-bold text-lg">
                          ₹{(item.price * item.quantity).toLocaleString()}
                        </span>
                      </div>
                    </div>
                  </div>
                </Card>
              ))}
            </div>

            {/* Order Summary */}
            <div className="lg:col-span-1">
              <Card className="sticky top-4">
                <CardHeader>
                  <CardTitle>Order Summary</CardTitle>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="flex justify-between">
                    <span>Subtotal ({totalItems} items)</span>
                    <span>₹{subtotal.toLocaleString()}</span>
                  </div>

                  <div className="flex justify-between">
                    <span>Delivery Charges</span>
                    <span className={deliveryCharges === 0 ? "text-green-600" : ""}>
                      {deliveryCharges === 0 ? "FREE" : `₹${deliveryCharges}`}
                    </span>
                  </div>

                  <div className="flex justify-between">
                    <span>Tax (18%)</span>
                    <span>₹{tax.toLocaleString()}</span>
                  </div>

                  <Separator />

                  <div className="flex justify-between text-xl font-bold">
                    <span>Total</span>
                    <span>₹{(subtotal + deliveryCharges + tax).toLocaleString()}</span>
                  </div>

                  {deliveryCharges > 0 && (
                    <div className="text-sm text-blue-600 bg-blue-50 p-3 rounded-lg">
                      💡 Add ₹{(50000 - subtotal).toLocaleString()} more for FREE delivery!
                    </div>
                  )}

                  <div className="space-y-3 pt-4">
                        <Link 
                            href="/checkout"
                            className="block w-full text-center bg-yellow-500 text-black py-3 sm:py-4 rounded-xl font-semibold hover:bg-yellow-600 transition-colors text-sm sm:text-base shadow-md"
                        >
                            Checkout
                        </Link>

                        <Link 
                            href="/shop"
                            className="block w-full text-center bg-white text-yellow-600 py-3 sm:py-4 rounded-xl font-semibold border border-yellow-500 hover:bg-yellow-50 transition-colors text-sm sm:text-base shadow-md"
                        >
                            Continue Shopping
                        </Link>
                  </div>

               
                </CardContent>
              </Card>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
