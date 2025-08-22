"use client"

import { ShoppingCart, Search, Menu } from "lucide-react"
import Topbar from "./Topbar"
import Link from "next/link"
import { useState, useEffect } from "react"
import CartSidebar from "./CartSidebar"
import { menuFetch } from "@/api/menu"
import { getGlobalSettings } from "@/api/globalSettings"


export default function Header() {
    const [mobileMenuOpen, setMobileMenuOpen] = useState(false)
    const [cartOpen, setCartOpen] = useState(false)
    const [menu, setMenu] = useState([])

    const [query, setQuery] = useState("")
    const [results, setResults] = useState([])
    const [loading, setLoading] = useState(false)
    const [showResults, setShowResults] = useState(false)
    const [settings, setSettings] = useState({})
    useEffect(() => {
        const delayDebounce = setTimeout(async () => {
            if (query.trim().length > 1) {
                setLoading(true)
                setShowResults(true)
                try {
                    const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/products/search?title=${query}`)
                    const json = await res.json()
                    setResults(json.data || [])
                } catch (error) {
                    console.error("Search error:", error)
                } finally {
                    setLoading(false)
                }
            } else {
                setResults([])
                setShowResults(false)
            }
        }, 400)

        return () => clearTimeout(delayDebounce)
    }, [query])

    const [cartItems, setCartItems] = useState([
        {
            id: 1,
            name: "Shalwar kameez for woman",
            price: 299,
            qty: 1,
            image: "/images/dress4.png",
            color: "Black",
        },
        {
            id: 2,
            name: "Casual Summer Dress",
            price: 199,
            qty: 2,
            image: "/images/dress2.png",
            color: "Silver",
        },
    ])

    useEffect(() => {
        const loadMenu = async () => {
            const data = await menuFetch(1)
            if (data?.data?.items) {
                setMenu(data.data.items) 
            } else {
                setMenu([])
            }
        }
        loadMenu()


        async function fetchSettings() {
            const data = await getGlobalSettings()
            setSettings(data)
        }
        fetchSettings()
    }, [])







    return (
        <header className="w-full shadow-lg">
            <Topbar />

            <div className="bg-base-white dark:bg-base-black dark:text-base-white transition-colors duration-300 px-6 py-4 flex justify-between items-center">
                {/* Left Side */}
                <div className="flex items-center space-x-8">
                    <Link href="/">
                        <img
                            src={`${process.env.NEXT_PUBLIC_WEB_BASE_URL}${settings.logo}`}
                            alt="MyShop Logo"
                            className="h-20 w-auto hover:scale-105 transition-transform duration-200"
                        />
                    </Link>

                    <ul className="hidden md:flex space-x-8 font-semibold uppercase text-sm relative">
                        {menu.map((item) => (
                            <li key={item.id} className="group relative">
                                <Link
                                    href={item.slug}
                                    className="hover:text-secondary transition-all duration-300 flex items-center gap-1"
                                >
                                    {item.name}
                                    {item.children?.length > 0 && <span className="mt-1 text-xs">▼</span>}
                                </Link>

                                {item.children?.length > 0 && (
                                    <ul className="absolute left-0 top-full hidden group-hover:flex flex-col bg-white shadow-xl rounded-xl py-2 min-w-[200px] transform scale-95 opacity-0 group-hover:scale-100 group-hover:opacity-100 transition-all duration-300 ease-out z-50">
                                        {item.children.map((child) => (
                                            <li key={child.id}>
                                                <Link
                                                    href={child.slug}
                                                    className="block px-5 py-2.5 rounded-md hover:bg-black hover:text-white transition-colors duration-300"
                                                >
                                                    {child.name}
                                                </Link>
                                            </li>
                                        ))}
                                    </ul>
                                )}
                            </li>
                        ))}
                    </ul>
                </div>

                {/* Right Side */}
                <div className="flex items-center space-x-4">
                    <div className="hidden md:flex items-center relative">
                        <div className="flex items-center border-2 border-neutral-light/30 rounded-full px-4 py-2.5 w-64 bg-neutral-light/5 hover:border-primary/50 transition-all duration-200 shadow-sm">
                            <input
                                type="text"
                                value={query}
                                onChange={(e) => setQuery(e.target.value)}
                                onFocus={() => query.trim().length > 1 && setShowResults(true)}
                                onBlur={() => setTimeout(() => setShowResults(false), 200)}
                                placeholder="Search products..."
                                className="flex-grow px-3 py-1 focus:outline-none bg-transparent placeholder:text-neutral-light/70 font-medium"
                            />
                            <Search
                                className="text-neutral-light hover:text-primary cursor-pointer transition-colors duration-200"
                                size={22}
                            />
                        </div>

                        {showResults && (
                            <div className="absolute top-full left-0 w-full bg-white dark:bg-gray-800 shadow-xl rounded-2xl border border-neutral-200 dark:border-gray-700 mt-2 max-h-96 overflow-y-auto z-50">
                                {loading ? (
                                    <div className="p-4 text-center text-gray-500">
                                        <div className="animate-spin rounded-full h-6 w-6 border-b-2 border-primary mx-auto"></div>
                                        <p className="mt-2 text-sm">Searching...</p>
                                    </div>
                                ) : results.length > 0 ? (
                                    <div className="py-2 divide-y divide-gray-100 dark:divide-gray-700">
                                        {results.map((product) => (
                                            <Link
                                                key={product.id}
                                                href={`/product/${product.slug || product.id}`}
                                                className="flex items-center gap-4 px-4 py-3 hover:bg-gray-50 dark:hover:bg-gray-700 transition-all duration-200"
                                                onClick={() => {
                                                    setQuery("")
                                                    setShowResults(false)
                                                }}
                                            >
                                                {product.image && (
                                                    <img
                                                        src={`${process.env.NEXT_PUBLIC_WEB_BASE_URL}${product.image}` || "/placeholder.svg"}
                                                        alt={product.title || product.name}
                                                        className="w-14 h-14 object-cover rounded-lg shadow-sm border border-gray-200 dark:border-gray-600"
                                                    />
                                                )}
                                                <div className="flex-grow">
                                                    <h4 className="font-semibold text-sm text-gray-900 dark:text-white line-clamp-1">
                                                        {product.title || product.name}
                                                    </h4>
                                                    {product.price && (
                                                        <p className="text-xs font-bold text-green-600 mt-1">
                                                            RS: {product.price.toLocaleString()}
                                                        </p>
                                                    )}
                                                </div>
                                            </Link>
                                        ))}
                                    </div>
                                ) : query.trim().length > 1 ? (
                                    <div className="p-6 text-center text-gray-500 text-sm">
                                        <Search className="mx-auto mb-2 text-gray-400" size={28} />
                                        <p>No products found for <span className="font-medium text-gray-700 dark:text-gray-300">"{query}"</span></p>
                                    </div>
                                ) : null}
                            </div>
                        )}

                    </div>

                    <button
                        onClick={() => setCartOpen(true)}
                        className="relative hover:text-primary transition-all duration-200 hover:scale-110 p-2 rounded-full hover:bg-primary/10"
                    >
                        <ShoppingCart size={24} />
                        <span className="absolute -top-1 -right-1 bg-red-700 text-white text-xs w-6 h-6 rounded-full flex items-center justify-center font-bold shadow-lg animate-bounce">
                            {cartItems.length}
                        </span>
                    </button>

                    <button
                        className="md:hidden p-2 rounded-full hover:bg-primary/10 transition-all duration-200"
                        onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
                    >
                        <Menu size={24} />
                    </button>
                </div>
            </div>

            {mobileMenuOpen && (
                <nav className="md:hidden bg-base-black dark:bg-base-white text-base-white dark:text-base-black transition-colors duration-300 px-6 py-4 shadow-inner">
                    <ul className="flex flex-col space-y-3 font-semibold uppercase text-sm">
                        <li>
                            <Link href="/" onClick={() => setMobileMenuOpen(false)}>
                                Home
                            </Link>
                        </li>
                        <li>
                            <Link href="/shop" onClick={() => setMobileMenuOpen(false)}>
                                Shop
                            </Link>
                        </li>
                        <li>
                            <Link href="/about" onClick={() => setMobileMenuOpen(false)}>
                                About
                            </Link>
                        </li>
                        <li>
                            <Link href="/contact" onClick={() => setMobileMenuOpen(false)}>
                                Contact
                            </Link>
                        </li>
                    </ul>
                </nav>
            )}

            {/* Cart Sidebar */}
            <CartSidebar cartOpen={cartOpen} setCartOpen={setCartOpen} cartItems={cartItems} />
        </header>
    )
}
