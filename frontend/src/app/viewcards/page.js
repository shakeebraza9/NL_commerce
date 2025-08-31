"use client"

import { useState } from "react"
import { Card, CardHeader, CardTitle, CardContent, Button, Separator } from "../../components/ui"

export default function ShoppingCart() {
  const [cartItems, setCartItems] = useState([
    {
      id: 1,
      name: "Premium Wireless Headphones",
      price: 15999,
      quantity: 2,
      image: "/premium-wireless-headphones-black.png",
      color: "Black",
      size: "Standard",
    },
    {
      id: 2,
      name: "Smart Watch Pro",
      price: 25999,
      quantity: 1,
      image: "/smartwatch-lifestyle.png",
      color: "Silver",
      size: "Medium",
    },
    {
      id: 3,
      name: "Bluetooth Speaker",
      price: 8999,
      quantity: 1,
      image: "/bluetooth-speaker.png",
      color: "Blue",
      size: "Portable",
    },
    {
      id: 4,
      name: "Gaming Mouse",
      price: 4999,
      quantity: 3,
      image: "/gaming-mouse.png",
      color: "RGB",
      size: "Standard",
    },
  ])

  const updateQuantity = (id, newQuantity) => {
    if (newQuantity < 1) return
    setCartItems((items) => items.map((item) => (item.id === id ? { ...item, quantity: newQuantity } : item)))
  }

  const removeItem = (id) => {
    setCartItems((items) => items.filter((item) => item.id !== id))
  }

  const clearCart = () => {
    setCartItems([])
  }

  const subtotal = cartItems.reduce((sum, item) => sum + item.price * item.quantity, 0)
  const deliveryCharges = subtotal > 50000 ? 0 : 500
  const tax = Math.round(subtotal * 0.18)
  const total = subtotal + deliveryCharges + tax

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
                <Button onClick={clearCart} className="bg-red-600 hover:bg-red-700 text-white px-4 py-2">
                  Clear Cart
                </Button>
              </div>

              {cartItems.map((item) => (
                <Card key={item.id} className="p-4">
                  <div className="flex gap-4">
                    {/* Product Image */}
                    <div className="w-24 h-24 bg-gray-100 rounded-lg overflow-hidden flex-shrink-0">
                      <img
                        src={item.image || "/placeholder.svg"}
                        alt={item.name}
                        className="w-full h-full object-cover"
                      />
                    </div>

                    {/* Product Details */}
                    <div className="flex-1">
                      <div className="flex justify-between items-start mb-2">
                        <h3 className="font-semibold text-lg">{item.name}</h3>
                        <Button
                          onClick={() => removeItem(item.id)}
                          className="bg-red-100 hover:bg-red-200 text-red-600 px-3 py-1 text-sm"
                        >
                          Remove
                        </Button>
                      </div>

                      <div className="text-sm text-gray-600 mb-2">
                        <span>Color: {item.color}</span> • <span>Size: {item.size}</span>
                      </div>

                      <div className="flex justify-between items-center">
                        <div className="text-xl font-bold text-green-600">₹{item.price.toLocaleString()}</div>

                        {/* Quantity Controls */}
                        <div className="flex items-center gap-3">
                          <span className="text-sm text-gray-600">Qty:</span>
                          <div className="flex items-center border rounded-lg">
                            <Button
                              onClick={() => updateQuantity(item.id, item.quantity - 1)}
                              className="bg-gray-100 hover:bg-gray-200 text-black px-3 py-1 rounded-r-none"
                            >
                              -
                            </Button>
                            <span className="px-4 py-1 bg-white border-x">{item.quantity}</span>
                            <Button
                              onClick={() => updateQuantity(item.id, item.quantity + 1)}
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
                        <span className="font-bold text-lg">₹{(item.price * item.quantity).toLocaleString()}</span>
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
                    <span>₹{total.toLocaleString()}</span>
                  </div>

                  {deliveryCharges > 0 && (
                    <div className="text-sm text-blue-600 bg-blue-50 p-3 rounded-lg">
                      💡 Add ₹{(50000 - subtotal).toLocaleString()} more for FREE delivery!
                    </div>
                  )}

                  <div className="space-y-3 pt-4">
                    <Button className="w-full bg-green-600 hover:bg-green-700 text-white py-3 text-lg font-semibold">
                      Proceed to Checkout
                    </Button>

                    <Button className="w-full bg-gray-100 hover:bg-gray-200 text-black py-2">Continue Shopping</Button>
                  </div>

                  {/* Promo Code */}
                  <div className="pt-4 border-t">
                    <h4 className="font-semibold mb-2">Have a promo code?</h4>
                    <div className="flex gap-2">
                      <input
                        type="text"
                        placeholder="Enter code"
                        className="flex-1 px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <Button className="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2">Apply</Button>
                    </div>
                  </div>
                </CardContent>
              </Card>
            </div>
          </div>
        )}

        {/* Recently Viewed */}
        {cartItems.length > 0 && (
          <div className="mt-12">
            <h2 className="text-2xl font-bold mb-6">You might also like</h2>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              {[1, 2, 3, 4].map((item) => (
                <Card key={item} className="p-4 hover:shadow-lg transition-shadow">
                  <div className="aspect-square bg-gray-100 rounded-lg mb-3 overflow-hidden">
                    <img
                      src={`/generic-product-display.png?height=200&width=200&query=product ${item}`}
                      alt={`Recommended product ${item}`}
                      className="w-full h-full object-cover"
                    />
                  </div>
                  <h3 className="font-semibold mb-1">Product {item}</h3>
                  <p className="text-green-600 font-bold">₹{(Math.random() * 20000 + 5000).toFixed(0)}</p>
                  <Button className="w-full mt-2 bg-blue-600 hover:bg-blue-700 text-white py-2">Add to Cart</Button>
                </Card>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
