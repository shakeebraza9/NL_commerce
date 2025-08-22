import Link from "next/link";

export default function CleanProduct({ product }) {
    return (
        <div className="bg-white border border-gray-200 rounded-lg overflow-hidden hover:shadow-lg transition-shadow duration-300 group">
            <div className="relative w-full h-64 overflow-hidden">
                <img
                    src={product.image || "/placeholder.svg"}
                    alt={product.name}
                    className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                />
                <img
                    src={product.hoverImage || product.image || "/placeholder.svg"}
                    alt={product.name}
                    className="absolute top-0 left-0 w-full h-full object-cover opacity-0 transition-opacity duration-500 group-hover:opacity-100"
                />

                {/* Discount Badge */}
                <div className="absolute top-2 left-2 bg-red-500 text-white px-2 py-1 rounded text-xs font-semibold">
                    -{Math.round(((product.originalPrice - product.discountPrice) / product.originalPrice) * 100)}%
                </div>

                {/* Heart Icon */}
                <button className="absolute top-2 right-2 p-1 bg-white rounded-full shadow-sm hover:shadow-md transition-shadow">
                    <svg
                        className="w-4 h-4 text-gray-400 hover:text-red-500"
                        fill="none"
                        stroke="currentColor"
                        viewBox="0 0 24 24"
                    >
                        <path
                            strokeLinecap="round"
                            strokeLinejoin="round"
                            strokeWidth={2}
                            d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"
                        />
                    </svg>
                </button>
            </div>

            <div className="p-4">
                <h3 className="font-medium text-gray-900 mb-2 line-clamp-2">{product.name}</h3>

                {/* Rating */}
                <div className="flex items-center mb-2">
                    <div className="flex">
                        {[...Array(5)].map((_, i) => (
                            <span
                                key={i}
                                className={`text-sm ${i < Math.floor(product.rating) ? "text-yellow-400" : "text-gray-300"}`}
                            >
                                ★
                            </span>
                        ))}
                    </div>
                    <span className="text-sm text-gray-500 ml-1">({product.reviews})</span>
                </div>

                {/* Price */}
                <div className="flex items-center gap-2 mb-3">
                    <span className="text-lg font-bold text-green-600">
                        RS:{product.discountPrice}
                    </span>
                    <span className="text-sm text-red-500 line-through">
                        RS:{product.originalPrice}
                    </span>
                </div>


                <Link
                    href={`/product/${product.slug}`}
                    className="w-full bg-black text-white py-2 px-4 rounded hover:bg-gray-800 transition-colors text-sm font-medium text-center block"
                >
                    View Product
                </Link>
            </div>
        </div>
    )
}