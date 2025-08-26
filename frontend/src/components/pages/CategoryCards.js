"use client";

import { useState } from "react";
import { useGetCategoriesQuery } from "@/features/categoriesApi";

export default function CategoryCards() {
const { data, isLoading, isError } = useGetCategoriesQuery();
const categories = data?.data || [];
const [hoveredIndex, setHoveredIndex] = useState(null);
if (isLoading) return <p>Loading categories...</p>;
if (isError) return <p>Failed to load categories</p>;

    return (
        <div
            className={`mt-12 px-4 gap-6 
                ${categories.length < 4
                    ? "flex justify-center flex-wrap"
                    : "grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4"}`}
        >
            {categories.map((cat, index) => (
                <div
                    key={cat.id}
                    className="group relative rounded-3xl overflow-hidden shadow-xl cursor-pointer 
                            transform transition-all duration-500 hover:scale-105 hover:-translate-y-2
                            bg-gradient-to-br from-white/10 to-white/5 backdrop-blur-sm
                            border border-white/20 hover:border-white/40
                            w-full sm:w-[45%] lg:w-auto max-w-sm"
                    onMouseEnter={() => setHoveredIndex(index)}
                    onMouseLeave={() => setHoveredIndex(null)}
                >
                    <div className="relative h-64 overflow-hidden">
                        <img
                            src={`${process.env.NEXT_PUBLIC_WEB_BASE_URL}${cat.image_id}` || "/placeholder.svg"}
                            alt={cat.title}
                            className="w-full h-full object-cover transform transition-all duration-700 
                                     group-hover:scale-110 group-hover:rotate-1"
                        />

                        <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/50 to-transparent 
                                        opacity-70 group-hover:opacity-90 transition-all duration-500">
                        </div>

                        <div className="absolute top-4 right-4 w-12 h-12 bg-white/20 backdrop-blur-md 
                                        rounded-full flex items-center justify-center text-2xl
                                        transform transition-all duration-500 group-hover:scale-110 group-hover:rotate-12">
                            🛍️
                        </div>
                    </div>

                    <div className="absolute inset-0 flex flex-col justify-end p-6">
                        <div className="transform transition-all duration-500 group-hover:-translate-y-2">
                            <h3 className="text-2xl font-bold text-white mb-2 tracking-wide drop-shadow-lg
                                           transform transition-all duration-500 group-hover:text-3xl">
                                {cat.title}
                            </h3>
                            <p className="text-white/80 text-sm opacity-0 transform translate-y-4
                                        group-hover:opacity-100 group-hover:translate-y-0
                                        transition-all duration-500 delay-100">
                                {cat.details}
                            </p>
                        </div>

                        <div className="mt-4 opacity-0 transform translate-y-4
                                        group-hover:opacity-100 group-hover:translate-y-0
                                        transition-all duration-500 delay-200">
                            <button className="px-4 py-2 bg-white/20 backdrop-blur-md rounded-full
                                               text-white text-sm font-medium border border-white/30
                                               hover:bg-white/30 transition-all duration-300
                                               transform hover:scale-105">
                                Shop Now →
                            </button>
                        </div>
                    </div>

                    <div className={`absolute inset-0 rounded-3xl transition-all duration-500
                                     ${hoveredIndex === index ? "shadow-2xl shadow-blue-500/20" : "shadow-lg"}`}>
                    </div>
                </div>
            ))}
        </div>
    );
}
