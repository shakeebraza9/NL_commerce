// lib/fetchTracking.js
export const fetchTrackingOrder = async (trackingId) => {
  if (!trackingId) throw new Error("Tracking ID is required")

  const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/order-tracking/${trackingId}`)
  const data = await res.json()

  if (!res.ok) {
    throw new Error(data.message || "Order not found")
  }

  return data
}
