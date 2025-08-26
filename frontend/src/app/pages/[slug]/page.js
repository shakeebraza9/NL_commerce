"use client"

import { useGetPageQuery } from "@/features/pagesApi"
import { useParams } from "next/navigation"
import Loader from "@/components/Loader"
import { useState, useEffect } from "react"


export default function DynamicPage() {
  const params = useParams()
  const slug = params.slug // "terms-conditions" ya "shipping-policy"

  const [theme, setTheme] = useState("light")
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    setMounted(true)
    const savedTheme = localStorage.getItem("theme") || "light"
    setTheme(savedTheme)
  }, [])

  useEffect(() => {
    if (mounted) {
      localStorage.setItem("theme", theme)
    }
  }, [theme, mounted])

  const { data, isLoading, error } = useGetPageQuery(slug)

  if (isLoading)
    return (
      <div
        className={`min-h-screen flex items-center justify-center ${
          theme === "dark" ? "bg-gradient-to-br from-gray-900 to-black" : "bg-gradient-to-br from-gray-50 to-white"
        }`}
      >
        <Loader />
      </div>
    )

  if (error || !data)
    return (
      <div
        className={`min-h-screen flex justify-center items-center ${
          theme === "dark" ? "bg-gradient-to-br from-gray-900 to-black" : "bg-gradient-to-br from-gray-50 to-white"
        }`}
      >
        <div
          className={`rounded-2xl shadow-xl p-8 max-w-md mx-4 border-2 border-yellow-400 ${
            theme === "dark" ? "bg-gray-800" : "bg-white"
          }`}
        >
          <div className="text-center">
            <div className="w-16 h-16 bg-yellow-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <svg className="w-8 h-8 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z"
                />
              </svg>
            </div>
            <h2 className={`text-2xl font-bold mb-2 ${theme === "dark" ? "text-white" : "text-gray-800"}`}>
              Page Not Found
            </h2>
            <p className={theme === "dark" ? "text-gray-300" : "text-gray-600"}>
              The page you're looking for doesn't exist or has been moved.
            </p>
          </div>
        </div>
      </div>
    )

  return (
    <div
      className={`min-h-screen bg-base-white dark:bg-base-black dark:text-base-white`}
    >
     

   

      <div className="relative z-10 py-12 px-4 sm:px-6 lg:px-8">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-12">
            <div className="inline-block">
              <h1
                className={`text-4xl sm:text-5xl lg:text-6xl font-bold mb-4 leading-tight bg-base-white dark:bg-base-black dark:text-base-white`}
              >
                {data.title}
              </h1>
              <div className="w-24 h-1 bg-gradient-to-r from-yellow-400 to-yellow-300 mx-auto rounded-full"></div>
            </div>
          </div>

          <div
            className={`shadow-2xl rounded-3xl border-2 border-yellow-400/30 overflow-hidden bg-base-white dark:bg-base-black dark:text-base-white backdrop-blur-sm`}
          >
            <div className="p-8 sm:p-12 lg:p-16">
              <div
                className="prose prose-lg sm:prose-xl max-w-none
                  prose-headings:text-gray-800 prose-headings:font-bold prose-headings:tracking-tight
                  prose-p:text-gray-700 prose-p:leading-relaxed prose-p:mb-6
                  prose-a:text-yellow-600 prose-a:no-underline hover:prose-a:text-yellow-800 hover:prose-a:underline prose-a:transition-all
                  prose-strong:text-gray-800 prose-strong:font-semibold
                  prose-ul:text-gray-700 prose-ol:text-gray-700
                  prose-li:mb-2 prose-li:leading-relaxed
                  prose-blockquote:border-l-4 prose-blockquote:border-yellow-500 prose-blockquote:bg-yellow-50 prose-blockquote:p-4 prose-blockquote:rounded-r-lg
                  prose-code:bg-gray-100 prose-code:px-2 prose-code:py-1 prose-code:rounded prose-code:text-sm
                  prose-pre:bg-gray-900 prose-pre:text-gray-100 prose-pre:rounded-xl prose-pre:p-6
                  prose-table:border-collapse prose-table:border prose-table:border-gray-200
                  prose-th:bg-gray-50 prose-th:border prose-th:border-gray-200 prose-th:p-3 prose-th:text-left prose-th:font-semibold
                  prose-td:border prose-td:border-gray-200 prose-td:p-3
                  prose-hr:border-gray-200 prose-hr:my-8"
                dangerouslySetInnerHTML={{ __html: data.longdetails }}
              />
            </div>

            <div
              className={`h-2 ${
                theme === "dark"
                  ? "bg-gradient-to-r from-black via-yellow-400 to-yellow-300"
                  : "bg-gradient-to-r from-gray-900 via-yellow-400 to-yellow-300"
              }`}
            ></div>
          </div>

          <div className="text-center mt-12">
            <button
              onClick={() => window.scrollTo({ top: 0, behavior: "smooth" })}
              className={`inline-flex items-center px-6 py-3 backdrop-blur-sm border-2 border-yellow-400 rounded-full hover:bg-yellow-400 hover:shadow-lg transition-all duration-300 group ${
                theme === "dark"
                  ? "bg-white/90 text-gray-800 hover:text-black"
                  : "bg-gray-900/90 text-white hover:text-black"
              }`}
            >
              <svg
                className="w-4 h-4 mr-2 group-hover:-translate-y-1 transition-transform"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 10l7-7m0 0l7 7m-7-7v18" />
              </svg>
              Back to Top
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
