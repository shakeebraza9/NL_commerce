"use client"
import { useState, useEffect } from "react"
import { useSearchParams, useRouter } from "next/navigation"
import CleanFilter from "@/components/shop/CleanFilter"
import CleanProduct from "@/components/shop/CleanProduct"
import Loader from "@/components/Loader"

export default function CleanShop() {
    const [products, setProducts] = useState([])
    const [loading, setLoading] = useState(true)
    const [currentPage, setCurrentPage] = useState(1)
    const [nextPageUrl, setNextPageUrl] = useState(null)
    const [prevPageUrl, setPrevPageUrl] = useState(null)
    const [totalPages, setTotalPages] = useState(1)
    const [viewMode, setViewMode] = useState("grid")
    const [sortBy, setSortBy] = useState("featured")

    const searchParams = useSearchParams()
    const router = useRouter()
    const API_BASE = process.env.NEXT_PUBLIC_BASE_URL + "/shop"

    const fetchProducts = async (page = 1) => {
        setLoading(true)
        try {
            const category = searchParams.get("category")
            const sort = searchParams.get("sort") || "featured"

            const query = new URLSearchParams()
            query.set("page", page)
            if (category) query.set("category", category)
            if (sort) query.set("sort", sort)

            const res = await fetch(`${API_BASE}?${query.toString()}`)
            if (!res.ok) throw new Error("Failed to fetch products")
            const result = await res.json()
            const data = result.data.data

            const mapped = data.map((item) => ({
                id: item.id,
                slug: item.slug,
                name: item.title,
                image: `${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.image}`,
                hoverImage: item.hover_image 
                    ? `${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.hover_image}` 
                    : `${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.image}`,
                originalPrice: item.selling_price,
                discountPrice: item.price,
                rating: 4.5,
                reviews: 120,
            }))

            setProducts(mapped)
            setNextPageUrl(result.data.next_page_url)
            setPrevPageUrl(result.data.prev_page_url)
            setTotalPages(Math.ceil(result.data.total / result.data.per_page))
        } catch (err) {
            console.error(err)
        } finally {
            setLoading(false)
        }
    }

    // Reload products whenever page, category, or sort changes
    useEffect(() => {
        fetchProducts(currentPage)
    }, [currentPage, searchParams])

    const handlePageChange = (page) => {
        if (page >= 1 && page <= totalPages) setCurrentPage(page)
    }

    const handleSortChange = (value) => {
        setSortBy(value)
        const category = searchParams.get("category")
        const query = new URLSearchParams()
        if (category) query.set("category", category)
        query.set("sort", value)
        router.push(`/shop?${query.toString()}`)
    }

    return (
        <>
            <Loader />
            <div className="min-h-screen bg-gray-50">
                <div className="max-w-7xl mx-auto px-4 py-6">
                    <div className="mb-6">
                        <h1 className="text-3xl font-bold text-gray-900 mb-2">Shop</h1>
                        <p className="text-gray-600">Discover our amazing products with great deals</p>
                    </div>

                    <div className="flex flex-col lg:flex-row gap-6">
                        {/* Sidebar Filters */}
                        <div className="w-full lg:w-1/4">
                            <CleanFilter />
                        </div>

                        {/* Main Content */}
                        <div className="w-full lg:w-3/4">
                            {/* Toolbar */}
                            <div className="flex items-center justify-between mb-6 bg-white border border-gray-200 rounded-lg p-4">
                                <div className="text-sm text-gray-600">
                                    Showing {products.length > 0 ? 1 : 0}-{products.length} of {totalPages * products.length} products
                                </div>

                                <div className="flex items-center gap-4">
                                    {/* Sort Dropdown */}
                                    <select
                                        value={sortBy}
                                        onChange={(e) => handleSortChange(e.target.value)}
                                        className="border border-gray-300 rounded px-3 py-1 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                                    >
                                        <option value="featured">Featured</option>
                                        <option value="newest">Newest</option>
                                        <option value="price-low">Price: Low to High</option>
                                        <option value="price-high">Price: High to Low</option>
                                    </select>

                                    {/* View Toggle */}
                                    <div className="flex border border-gray-300 rounded overflow-hidden">
                                        <button
                                            onClick={() => setViewMode("grid")}
                                            className={`p-2 ${viewMode === "grid" ? "bg-black text-white" : "bg-white text-gray-600 hover:bg-gray-50"}`}
                                        >
                                            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                                <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
                                            </svg>
                                        </button>
                                        <button
                                            onClick={() => setViewMode("list")}
                                            className={`p-2 ${viewMode === "list" ? "bg-black text-white" : "bg-white text-gray-600 hover:bg-gray-50"}`}
                                        >
                                            <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                                <path
                                                    fillRule="evenodd"
                                                    d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                                                    clipRule="evenodd"
                                                />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            {/* Products Grid */}
                            {loading ? (
                                <p>Loading products...</p>
                            ) : (
                                <div className={`grid ${viewMode === "grid" ? "grid-cols-1 md:grid-cols-2 lg:grid-cols-3" : "grid-cols-1"} gap-6`}>
                                    {products.map((product) => (
                                        <CleanProduct key={product.id} product={product} />
                                    ))}
                                </div>
                            )}

                            {/* Pagination */}
                            <div className="flex justify-center mt-8 flex-wrap gap-2">
                                <button
                                    onClick={() => handlePageChange(currentPage - 1)}
                                    disabled={!prevPageUrl}
                                    className="px-3 py-2 border border-gray-300 rounded hover:bg-gray-50 text-sm disabled:opacity-50 disabled:cursor-not-allowed"
                                >
                                    Previous
                                </button>

                                {Array.from({ length: totalPages }, (_, i) => i + 1).map((page) => (
                                    <button
                                        key={page}
                                        onClick={() => handlePageChange(page)}
                                        className={`px-3 py-2 rounded text-sm ${page === currentPage
                                            ? "bg-black text-white"
                                            : "border border-gray-300 hover:bg-gray-50 text-gray-700"
                                            }`}
                                    >
                                        {page}
                                    </button>
                                ))}

                                <button
                                    onClick={() => handlePageChange(currentPage + 1)}
                                    disabled={!nextPageUrl}
                                    className="px-3 py-2 border border-gray-300 rounded hover:bg-gray-50 text-sm disabled:opacity-50 disabled:cursor-not-allowed"
                                >
                                    Next
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    )
}
