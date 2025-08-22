"use client"
import { useState, useEffect } from "react"
import { menuFetch } from "@/api/menu"
import toast from "react-hot-toast"
import { Facebook, Instagram, Youtube } from "lucide-react"
import { getGlobalSettings } from "@/api/globalSettings"


export default function Footer() {
    const [quickLinks, setQuickLinks] = useState([])
    const [customerService, setCustomerService] = useState([])
    const [email, setEmail] = useState("")
    const [loading, setLoading] = useState(false)
    const [message, setMessage] = useState("")
    const [settings, setSettings] = useState({})
    const handleSubmit = async (e) => {
    e.preventDefault()
    setLoading(true)

    try {
        const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/subscribe`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ email }),
        })

        if (!res.ok) {
            throw new Error("Failed to subscribe")
        }

        const data = await res.json()
        toast.success("Subscribed successfully!")

        // Reset the input field
        setEmail("")
    } catch (error) {
        toast.error("Something went wrong. Try again.")
        console.error("Subscribe error:", error)
    } finally {
        setLoading(false)
    }
}

    useEffect(() => {
        const loadMenus = async () => {
            // Quick Links (id = 2)
            const quickLinksData = await menuFetch(2)
            setQuickLinks(quickLinksData?.data?.items || [])

            // Customer Service (id = 3)
            const customerServiceData = await menuFetch(3)
            setCustomerService(customerServiceData?.data?.items || [])
        }

        loadMenus()

        async function fetchSettings() {
            const data = await getGlobalSettings()
            setSettings(data)
        }
        fetchSettings()
    }, [])

    return (
        <footer className="bg-black text-white py-16 px-6">
            <div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-4 gap-12">

         
             <div>
                <h2 className="text-2xl font-bold mb-4">{settings.site_title ?? ''}</h2>

                <p className="text-gray-400 flex items-center gap-2">
                    <img
                    src={process.env.NEXT_PUBLIC_WEB_BASE_URL + settings.logo ?? "/default-logo.png"}
                    alt="Logo"
                    className="w-20 h-16 object-contain"
                    />
                
                </p>
                </div>



                {/* Quick Links */}
                <div>
                    <h3 className="text-lg font-semibold mb-4">Quick Links</h3>
                    <ul className="space-y-2">
                        {quickLinks.map((item) => (
                            <li key={item.id}>
                                <a
                                    href={item.slug || "#"}
                                    className="hover:text-yellow-400 transition-colors"
                                >
                                    {item.name}
                                </a>
                            </li>
                        ))}
                    </ul>
                </div>

                {/* Customer Service */}
                <div>
                    <h3 className="text-lg font-semibold mb-4">Customer Service</h3>
                    <ul className="space-y-2">
                        {customerService.map((item) => (
                            <li key={item.id}>
                                <a
                                    href={item.slug || "#"}
                                    className="hover:text-yellow-400 transition-colors"
                                >
                                    {item.name}
                                </a>
                            </li>
                        ))}
                    </ul>
                </div>

                {/* Newsletter & Social */}
             <div>
                <h3 className="text-lg font-semibold mb-4">Subscribe</h3>
                <p className="text-gray-400 mb-4">Get the latest updates on new arrivals and sales.</p>

                <form onSubmit={handleSubmit} className="flex flex-col sm:flex-row gap-2">
                    <input
                        type="email"
                        placeholder="Your email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        required
                        className="p-3 rounded-lg bg-gray-900 text-white placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-yellow-400"
                    />

                    <button
                        type="submit"
                        disabled={loading}
                        className={`flex items-center justify-center bg-yellow-400 text-black px-5 py-3 rounded-lg font-semibold transition-colors ${
                            loading ? "opacity-70 cursor-not-allowed" : "hover:bg-yellow-500"
                        }`}
                    >
                        {loading ? (
                            <svg
                                className="animate-spin h-5 w-5 text-black"
                                xmlns="http://www.w3.org/2000/svg"
                                fill="none"
                                viewBox="0 0 24 24"
                            >
                                <circle
                                    className="opacity-25"
                                    cx="12"
                                    cy="12"
                                    r="10"
                                    stroke="currentColor"
                                    strokeWidth="4"
                                ></circle>
                                <path
                                    className="opacity-75"
                                    fill="currentColor"
                                    d="M4 12a8 8 0 018-8v4l3-3-3-3v4a8 8 0 100 16v-4l-3 3 3 3v-4a8 8 0 01-8-8z"
                                ></path>
                            </svg>
                        ) : (
                            "Subscribe"
                        )}
                    </button>

                    {message && (
                        <p className="mt-2 text-sm text-gray-300 sm:ml-2">{message}</p>
                    )}
                </form>

               
                <div className="flex gap-4 mt-4">
                {settings.facebook_link && settings.facebook_link !== "#" && (
                    <a href={settings.facebook_link} target="_blank" rel="noopener noreferrer">
                    <Facebook className="w-6 h-6 text-gray-400 hover:text-blue-600 transition-colors" />
                    </a>
                )}

                {settings.instagram_link && settings.instagram_link !== "#" && (
                    <a href={settings.instagram_link} target="_blank" rel="noopener noreferrer">
                    <Instagram className="w-6 h-6 text-gray-400 hover:text-pink-500 transition-colors" />
                    </a>
                )}

                {settings.youtube_link && settings.youtube_link !== "#" && (
                    <a href={settings.youtube_link} target="_blank" rel="noopener noreferrer">
                    <Youtube className="w-6 h-6 text-gray-400 hover:text-red-600 transition-colors" />
                    </a>
                )}
                </div>

            </div>
            </div>

          
            <div className="mt-12 border-t border-gray-800 pt-6 text-center text-gray-400 text-sm">
                &copy; {new Date().getFullYear()} Fashionista. All rights reserved.
            </div>
        </footer>
    )
}
