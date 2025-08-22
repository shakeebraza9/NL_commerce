"use client"
import { useState } from "react"

export default function CleanFilter() {
    const [selectedCategories, setSelectedCategories] = useState(["all"])
    const [selectedBrands, setSelectedBrands] = useState([])
    const [priceRange, setPriceRange] = useState([0, 500])
    const [selectedRating, setSelectedRating] = useState("all")

    const categories = [
        { id: "all", label: "All" },
        { id: "electronics", label: "Electronics" },
        { id: "home", label: "Home" },
        { id: "fashion", label: "Fashion" },
        { id: "sports", label: "Sports" },
    ]

    const brands = [
        { id: "techsound", label: "TechSound" },
        { id: "fitech", label: "FiTech" },
        { id: "brewmaster", label: "BrewMaster" },
        { id: "gamepro", label: "GamePro" },
        { id: "powermax", label: "PowerMax" },
        { id: "chargefast", label: "ChargeFast" },
    ]

    const ratings = [
        { id: "4+", label: "4+ Stars", stars: 4 },
        { id: "3+", label: "3+ Stars", stars: 3 },
        { id: "2+", label: "2+ Stars", stars: 2 },
        { id: "1+", label: "1+ Stars", stars: 1 },
        { id: "all", label: "All", stars: 0 },
    ]

    const handleCategoryChange = (categoryId) => {
        if (categoryId === "all") {
            setSelectedCategories(["all"])
        } else {
            const newCategories = selectedCategories.filter((c) => c !== "all")
            if (selectedCategories.includes(categoryId)) {
                const filtered = newCategories.filter((c) => c !== categoryId)
                setSelectedCategories(filtered.length === 0 ? ["all"] : filtered)
            } else {
                setSelectedCategories([...newCategories, categoryId])
            }
        }
    }

    const handleBrandChange = (brandId) => {
        if (selectedBrands.includes(brandId)) {
            setSelectedBrands(selectedBrands.filter((b) => b !== brandId))
        } else {
            setSelectedBrands([...selectedBrands, brandId])
        }
    }

    return (
        <div className="bg-white border border-gray-200 rounded-lg p-6">
            <div className="flex items-center justify-between mb-6">
                <h2 className="text-lg font-semibold text-gray-900">Filters</h2>
                <button className="text-sm text-blue-600 hover:text-blue-800">Clear All</button>
            </div>

            {/* Category */}
            <div className="mb-6">
                <h3 className="text-sm font-medium text-gray-900 mb-3">Category</h3>
                <div className="space-y-2">
                    {categories.map((category) => (
                        <label key={category.id} className="flex items-center">
                            <input
                                type="checkbox"
                                checked={selectedCategories.includes(category.id)}
                                onChange={() => handleCategoryChange(category.id)}
                                className="h-4 w-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500"
                            />
                            <span className="ml-2 text-sm text-gray-700">{category.label}</span>
                        </label>
                    ))}
                </div>
            </div>

            {/* Brand */}
            <div className="mb-6">
                <h3 className="text-sm font-medium text-gray-900 mb-3">Brand</h3>
                <div className="space-y-2 max-h-32 overflow-y-auto">
                    {brands.map((brand) => (
                        <label key={brand.id} className="flex items-center">
                            <input
                                type="checkbox"
                                checked={selectedBrands.includes(brand.id)}
                                onChange={() => handleBrandChange(brand.id)}
                                className="h-4 w-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500"
                            />
                            <span className="ml-2 text-sm text-gray-700">{brand.label}</span>
                        </label>
                    ))}
                </div>
            </div>

            {/* Price Range */}
            <div className="mb-6">
                <h3 className="text-sm font-medium text-gray-900 mb-3">Price Range</h3>
                <div className="px-2">
                    <input
                        type="range"
                        min="0"
                        max="500"
                        value={priceRange[1]}
                        onChange={(e) => setPriceRange([priceRange[0], Number(e.target.value)])}
                        className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer slider"
                    />
                    <div className="flex justify-between text-sm text-gray-500 mt-2">
                        <span>${priceRange[0]}</span>
                        <span>${priceRange[1]}</span>
                    </div>
                </div>
            </div>

            {/* Minimum Rating */}
            <div className="mb-6">
                <h3 className="text-sm font-medium text-gray-900 mb-3">Minimum Rating</h3>
                <div className="space-y-2">
                    {ratings.map((rating) => (
                        <label key={rating.id} className="flex items-center">
                            <input
                                type="radio"
                                name="rating"
                                value={rating.id}
                                checked={selectedRating === rating.id}
                                onChange={(e) => setSelectedRating(e.target.value)}
                                className="h-4 w-4 text-blue-600 border-gray-300 focus:ring-blue-500"
                            />
                            <span className="ml-2 flex items-center">
                                {rating.stars > 0 && (
                                    <div className="flex mr-1">
                                        {[...Array(rating.stars)].map((_, i) => (
                                            <span key={i} className="text-yellow-400 text-sm">
                                                ★
                                            </span>
                                        ))}
                                        {[...Array(5 - rating.stars)].map((_, i) => (
                                            <span key={i} className="text-gray-300 text-sm">
                                                ★
                                            </span>
                                        ))}
                                    </div>
                                )}
                                <span className="text-sm text-gray-700">{rating.label}</span>
                            </span>
                        </label>
                    ))}
                </div>
            </div>
        </div>
    )
}
