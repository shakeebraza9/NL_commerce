import ProductImages from "@/components/product/ProductImages"
import ProductInfo from "@/components/product/ProductInfo"
import ProductTabs from "@/components/product/ProductTabs"
import RelatedProducts from "@/components/product/RelatedProducts"

// Sample product data
const sampleProduct = {
    id: 1,
    name: "Wireless Bluetooth Headphones",
    brand: "TechSound",
    price: 299,
    originalPrice: 399,
    rating: 4.5,
    reviews: 324,
    description:
        "Premium wireless headphones with active noise cancellation, 30-hour battery life, and superior sound quality. Perfect for music lovers and professionals.",
    sizes: ["Small", "Medium", "Large"],
    specifications: [
        { label: "Battery Life", value: "30 hours" },
        { label: "Charging Time", value: "2 hours" },
        { label: "Weight", value: "250g" },
        { label: "Connectivity", value: "Bluetooth 5.0" },
        { label: "Noise Cancellation", value: "Active ANC" },
        { label: "Warranty", value: "1 Year" },
    ],
    customerReviews: [
        {
            name: "John Smith",
            rating: 5,
            date: "2 weeks ago",
            comment:
                "Amazing sound quality and comfortable to wear for long periods. The noise cancellation works perfectly!",
        },
        {
            name: "Sarah Johnson",
            rating: 4,
            date: "1 month ago",
            comment: "Great headphones overall. Battery life is excellent and the build quality feels premium.",
        },
        {
            name: "Mike Wilson",
            rating: 5,
            date: "3 weeks ago",
            comment: "Best headphones I've ever owned. Worth every penny!",
        },
    ],
}

const productImages = [
    "/images/dress1.png",
    "/images/dress1-hover.png",
];

const relatedProducts = [
    { id: 1, name: "Elegant Evening Gown", image: "/images/dress1.png", hoverImage: "images/dress1-hover.png", originalPrice: 1200, discountPrice: 1100, rating: 4.8, reviews: 142 },
    { id: 2, name: "Casual Summer Dress", image: "/images/dress2.png", hoverImage: "images/dress2-hover.png", originalPrice: 1200, discountPrice: 1100, rating: 4.5, reviews: 86 },
    { id: 3, name: "Designer Party Dress", image: "/images/dress3.png", hoverImage: "images/dress3-hover.png", originalPrice: 1200, discountPrice: 1100, rating: 4.9, reviews: 213 },
    { id: 4, name: "Shalwar kameez for woman", image: "/images/dress4.png", hoverImage: "images/dress4-hover.png", originalPrice: 1200, discountPrice: 1100, rating: 4.9, reviews: 213 },
]

export default function ProductDetail() {
    return (
        <div className="min-h-screen bg-white">
            {/* Breadcrumb */}
            <div className="border-b">
                <div className="max-w-7xl mx-auto px-4 py-4">
                    <nav className="text-sm text-gray-500">
                        <span>Home</span> / <span>Electronics</span> / <span>Headphones</span> /
                        <span className="text-gray-900"> {sampleProduct.name}</span>
                    </nav>
                </div>
            </div>

            {/* Main Product Section */}
            <div className="max-w-7xl mx-auto px-4 py-8">
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
                    {/* Product Images */}
                    <ProductImages images={productImages} productName={sampleProduct.name} />

                    {/* Product Info */}
                    <ProductInfo product={sampleProduct} />
                </div>

                {/* Product Tabs */}
                <div className="mt-16">
                    <ProductTabs product={sampleProduct} />
                </div>

                {/* Related Products */}
                <div className="mt-16">
                    <RelatedProducts products={relatedProducts} />
                </div>
            </div>
        </div>
    )
}
