"use client"
import { useEffect, useState,useRef } from "react"
import { useParams } from "next/navigation"
import ProductImages from "@/components/product/ProductImages"
import ProductInfo from "@/components/product/ProductInfo"
import ProductTabs from "@/components/product/ProductTabs"
import RelatedProducts from "@/components/product/RelatedProducts"
import Loader from "@/components/Loader"; 
import { useTrackActivityMutation } from "@/features/trackActivityApi";

export default function ProductDetail() {
    const { id  } = useParams()   
    const [productData, setProductData] = useState(null)
    const [loading, setLoading] = useState(true)
    const [trackActivity] = useTrackActivityMutation();
    const hasTracked = useRef(false); 
useEffect(() => {
    if (!id) return

    const fetchProduct = async () => {
        try {
            const res = await fetch(`http://127.0.0.1:8000/api/v1/product/${id}`)
            const data = await res.json()
            if (data.status) {
                setProductData(data.data)
            }
        } catch (error) {
            console.error("Error fetching product:", error)
        } finally {
            setLoading(false)
        }
    }

    const logActivity = async () => {
        if (hasTracked.current) return; 
        hasTracked.current = true

        try {
            const ip = await fetch("https://api.ipify.org?format=json")
              .then((res) => res.json())
              .then((data) => data.ip);

            await trackActivity({
              page_name: "Product-Detail",
              ip_address: ip,
            });
        } catch (error) {
            console.error("Tracking failed", error);
        }
    }

    fetchProduct()
    logActivity()
}, [id])


    if (loading) {
        return  <Loader />
    }

    if (!productData) {
        return <div className="text-center py-20 text-red-500">Product not found</div>
    }
    

   const { product, attributes, values, customerReviews,variations, related_products, discount_percent } = productData

 
   let productImages = []

    if (product.gallery && product.gallery.trim() !== "") {
    productImages = product.gallery.split(",").filter(Boolean).map(img => process.env.NEXT_PUBLIC_WEB_BASE_URL  + img)
    } else {
    productImages = [
        process.env.NEXT_PUBLIC_WEB_BASE_URL + product.image,
        process.env.NEXT_PUBLIC_WEB_BASE_URL  + product.hover_image
    ].filter(Boolean)
    }


    return (
        <div className="min-h-screen bg-base-white dark:bg-base-black dark:text-base-white">
            {/* Breadcrumb */}
            <div className="border-b">
                <div className="max-w-7xl mx-auto px-4 py-4">
                    <nav className="text-sm text-gray-500">
                        <span>Home</span> / 
                        <span> Category</span> / 
                        <span> {product.title}</span>
                    </nav>
                </div>
            </div>

            {/* Main Product Section */}
            <div className="max-w-7xl mx-auto px-4 py-8">
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
                    {/* Product Images */}
                    <ProductImages images={productImages} productName={product.title} />

                    {/* Product Info */}
                    <ProductInfo product={product}  variation={variations} />
                </div>

                {/* Product Tabs */}
                <div className="mt-16">
                    <ProductTabs customerReviews={customerReviews} productId={product.id} variation={variations}/>
                </div>

                {/* Related Products */}
                <div className="mt-16">
                    <RelatedProducts products={related_products} />
                </div>
            </div>
        </div>
    )
}
