"use client"
import { useEffect, useState } from "react"

export default function Loader() {
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        // Real site me yeh replace karein with your data loading state
        const timer = setTimeout(() => setLoading(false), 2000)
        return () => clearTimeout(timer)
    }, [])

    if (!loading) return null

    return (
        <div className="fixed inset-0 bg-black/90 flex flex-col items-center justify-center z-50">
            <h1 className="text-white text-3xl font-bold mb-8">Loading...</h1>
            <div className="flex space-x-3">
                <span className="w-5 h-5 bg-white rounded-full animate-bounce delay-0"></span>
                <span className="w-5 h-5 bg-white rounded-full animate-bounce delay-150"></span>
                <span className="w-5 h-5 bg-white rounded-full animate-bounce delay-300"></span>
            </div>
            <p className="text-gray-300 mt-6 tracking-widest uppercase text-sm">
                Please wait
            </p>
            <style jsx>{`
        .animate-bounce {
          display: inline-block;
          animation: bounce 1s infinite;
        }
        .delay-0 { animation-delay: 0s; }
        .delay-150 { animation-delay: 0.15s; }
        .delay-300 { animation-delay: 0.3s; }
        @keyframes bounce {
          0%, 80%, 100% { transform: scale(0); }
          40% { transform: scale(1); }
        }
      `}</style>
        </div>
    )
}
