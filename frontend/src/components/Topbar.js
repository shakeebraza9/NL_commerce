"use client"

import { Sun, Moon, Phone, Mail } from "lucide-react"
import { useTheme } from "next-themes"
import { useEffect, useState } from "react"
import { getGlobalSettings } from "@/api/globalSettings"

export default function Topbar() {
    const { theme, setTheme } = useTheme()
    const [mounted, setMounted] = useState(false)
    const [settings, setSettings] = useState({})

    useEffect(() => {
        setMounted(true)

        async function fetchSettings() {
            const data = await getGlobalSettings()
            setSettings(data)
        }
        fetchSettings()
    }, [])

    return (
        <div className="relative bg-black text-white">
            <div className="bg-base-black text-base-white text-sm px-6 py-3 flex justify-between items-center transition-colors duration-300">
                <div className="flex items-center space-x-8">
                    <div className="flex items-center space-x-2 hover:text-secondary transition-colors duration-200">
                        <Phone size={16} className="text-secondary" />
                        <span className="font-medium">{settings.phone_number || "+92 300 1234567"}</span>
                    </div>
                    <div className="flex items-center space-x-2 hover:text-secondary transition-colors duration-200">
                        <Mail size={16} className="text-secondary" />
                        <span className="font-medium">{settings.email_address || "support@myshop.com"}</span>
                    </div>
                </div>
                <div className="flex items-center space-x-6">
                    {mounted && (
                        <button
                            onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
                            className="ml-4 p-2.5 rounded-full bg-neutral-light/20 hover:bg-neutral-light/30 transition-all duration-200 hover:scale-110 active:scale-95"
                            aria-label="Toggle theme"
                        >
                            {theme === "dark" ? (
                                <Sun size={18} className="text-yellow-400" />
                            ) : (
                                <Moon size={18} className="text-blue-400" />
                            )}
                        </button>
                    )}
                </div>
            </div>

            <div className="h-[3px] w-full bg-gradient-to-r from-secondary/60 via-primary/80 to-secondary/60 animate-pulse"></div>
        </div>
    )
}
