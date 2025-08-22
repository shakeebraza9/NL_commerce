"use client";
import { useState, useEffect, useCallback } from "react";
import { ChevronLeft, ChevronRight, Play, Pause } from "lucide-react";
import { slidersFetch } from "@/api/sliders";

export default function Carousel() {
    const [sliders, setSliders] = useState([]);
    const [current, setCurrent] = useState(0);
    const [isPlaying, setIsPlaying] = useState(true);
    const [isTransitioning, setIsTransitioning] = useState(false);

    // 🔹 API se sliders fetch karna
    useEffect(() => {
        const loadSliders = async () => {
            const data = await slidersFetch();
            if (data?.data) {
                setSliders(data.data);
            }
        };
        loadSliders();
    }, []);

    const nextSlide = useCallback(() => {
        if (isTransitioning || sliders.length === 0) return;
        setIsTransitioning(true);
        setCurrent((c) => (c === sliders.length - 1 ? 0 : c + 1));
        setTimeout(() => setIsTransitioning(false), 500);
    }, [isTransitioning, sliders.length]);

    const prevSlide = useCallback(() => {
        if (isTransitioning || sliders.length === 0) return;
        setIsTransitioning(true);
        setCurrent((c) => (c === 0 ? sliders.length - 1 : c - 1));
        setTimeout(() => setIsTransitioning(false), 500);
    }, [isTransitioning, sliders.length]);

    useEffect(() => {
        if (!isPlaying || sliders.length === 0) return;
        const interval = setInterval(nextSlide, 4000);
        return () => clearInterval(interval);
    }, [isPlaying, nextSlide, sliders.length]);

    if (sliders.length === 0) {
        return <div className="w-full h-96 flex items-center justify-center">Loading sliders...</div>;
    }

    return (
        <div
            className="relative w-full h-96 md:h-[500px] lg:h-[600px] overflow-hidden rounded-2xl shadow-2xl group"
            onMouseEnter={() => setIsPlaying(false)}
            onMouseLeave={() => setIsPlaying(true)}
        >
            <div
                className="flex transition-transform duration-500 ease-out h-full"
                style={{ transform: `translateX(-${current * 100}%)` }}
            >
                {sliders.map((slide, index) => (
                    <img
                        key={index}
                        src={`${process.env.NEXT_PUBLIC_WEB_BASE_URL}${slide.image_id}` || "/placeholder.svg"} // 🔹 API image field
                        alt={`${slide.title}` || `Slide ${index + 1}`}
                        className="w-full h-full object-cover flex-shrink-0"
                    />
                ))}
            </div>

            {/* Overlay */}
            <div className="absolute inset-0 bg-gradient-to-r from-black/20 via-transparent to-black/20 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />

            {/* Prev Button */}
            <button
                onClick={prevSlide}
                disabled={isTransitioning}
                className="absolute left-4 top-1/2 -translate-y-1/2 bg-white/90 text-gray-800 p-3 rounded-full shadow-lg hover:bg-white hover:scale-110 transition-all duration-300 opacity-0 group-hover:opacity-100 disabled:opacity-50"
            >
                <ChevronLeft size={20} />
            </button>

            {/* Next Button */}
            <button
                onClick={nextSlide}
                disabled={isTransitioning}
                className="absolute right-4 top-1/2 -translate-y-1/2 bg-white/90 text-gray-800 p-3 rounded-full shadow-lg hover:bg-white hover:scale-110 transition-all duration-300 opacity-0 group-hover:opacity-100 disabled:opacity-50"
            >
                <ChevronRight size={20} />
            </button>

            {/* Play/Pause */}
            <button
                onClick={() => setIsPlaying((p) => !p)}
                className="absolute top-4 right-4 bg-white/90 text-gray-800 p-2 rounded-full shadow-lg hover:bg-white hover:scale-110 transition-all duration-300 opacity-0 group-hover:opacity-100"
            >
                {isPlaying ? <Pause size={16} /> : <Play size={16} />}
            </button>

            {/* Dots */}
            <div className="absolute bottom-4 left-1/2 -translate-x-1/2 flex space-x-2">
                {sliders.map((_, index) => (
                    <button
                        key={index}
                        onClick={() => {
                            if (!isTransitioning) {
                                setIsTransitioning(true);
                                setCurrent(index);
                                setTimeout(() => setIsTransitioning(false), 500);
                            }
                        }}
                        className={`w-3 h-3 rounded-full transition-all duration-300 ${index === current
                            ? "bg-white scale-125 shadow-lg"
                            : "bg-white/50 hover:bg-white/75 hover:scale-110"
                            }`}
                    />
                ))}
            </div>
        </div>
    );
}
