"use client"

import { useEffect, useState } from "react"
import CleanProduct from "../shop/CleanProduct"

export default function DressCollection() {
    const [products, setProducts] = useState([])
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        const fetchProducts = async () => {
            try {
                const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/products/popular`, {
                    cache: "no-store",
                })
                const json = await res.json()

                if (json.status && Array.isArray(json.data)) {
                    const mapped = json.data.map((item) => ({
                        id: item.id,
                        slug: item.slug,
                        name: item.title,
                        image: `${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.image}`,
                        hoverImage: item.hover_image ? `${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.hover_image}` : `http://127.0.0.1:8000/${item.image}`,
                        originalPrice: item.selling_price,
                        discountPrice: item.price,
                        rating: 4.5,
                        reviews: 120,
                    }))
                    setProducts(mapped)
                }
            } catch (error) {
                console.error("Error fetching products:", error)
            } finally {
                setLoading(false)
            }
        }

        fetchProducts()
    }, [])

    return (
        <section className="max-w-7xl mx-auto px-5 py-10">
            <h2 className="text-3xl font-bold mb-8 text-gray-900 dark:text-white">Popular Products</h2>

            {loading ? (
                <p className="text-gray-500"></p>
            ) : (
                <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                    {products.map((product) => (
                        <CleanProduct key={product.id} product={product} />
                    ))}
                </div>
            )}
        </section>
    )
}
