"use client";
import { useState, useEffect, useCallback } from "react";
import { ChevronLeft, ChevronRight, Play, Pause } from "lucide-react";
import { useGetSlidersQuery } from "@/features/slidersApi";

export default function Carousel() {
  const { data, isLoading, error } = useGetSlidersQuery();
  const sliders = data?.data || [];
  const [current, setCurrent] = useState(0);
  const [isPlaying, setIsPlaying] = useState(true);
  const [isTransitioning, setIsTransitioning] = useState(false);

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

  if (isLoading) {
  return (
    <div className="flex items-center justify-center py-20 bg-white">
      <div className="flex flex-col items-center">
        {/* Spinner */}
        <div className="w-12 h-12 border-4 border-yellow-400 border-t-transparent rounded-full animate-spin"></div>
        
        {/* Text */}
        <p className="mt-4 text-gray-700 font-medium animate-pulse">
          Loading sliders...
        </p>
      </div>
    </div>
  )
}
  if (error) return <div>Error loading sliders</div>;

  return (
    <div
      className="relative w-full h-96 md:h-[500px] lg:h-[600px] overflow-hidden rounded-2xl shadow-2xl group"
      onMouseEnter={() => setIsPlaying(false)}
      onMouseLeave={() => setIsPlaying(true)}
    >
      {/* Slides */}
      <div
        className="flex transition-transform duration-500 ease-out h-full"
        style={{ transform: `translateX(-${current * 100}%)` }}
      >
        {sliders.map((slide, index) => (
          <img
            key={index}
            src={`${process.env.NEXT_PUBLIC_WEB_BASE_URL}${slide.image_id}` || "/placeholder.svg"}
            alt={slide.title || `Slide ${index + 1}`}
            className="w-full h-full object-cover flex-shrink-0"
          />
        ))}
      </div>

      {/* Prev/Next buttons */}
      <button
        onClick={prevSlide}
        className="absolute top-1/2 left-4 -translate-y-1/2 bg-black/40 text-white p-2 rounded-full hover:bg-black/60 transition z-10"
      >
        <ChevronLeft size={24} />
      </button>
      <button
        onClick={nextSlide}
        className="absolute top-1/2 right-4 -translate-y-1/2 bg-black/40 text-white p-2 rounded-full hover:bg-black/60 transition z-10"
      >
        <ChevronRight size={24} />
      </button>

      {/* Dots */}
      <div className="absolute bottom-4 left-1/2 -translate-x-1/2 flex space-x-2">
        {sliders.map((_, index) => (
          <button
            key={index}
            onClick={() => setCurrent(index)}
            className={`w-3 h-3 rounded-full transition ${
              index === current ? "bg-white" : "bg-white/50"
            }`}
          />
        ))}
      </div>

      {/* Play/Pause Button */}
      <button
        onClick={() => setIsPlaying(!isPlaying)}
        className="absolute top-4 right-4 bg-black/40 text-white p-2 rounded-full hover:bg-black/60 transition"
      >
        {isPlaying ? <Pause size={20} /> : <Play size={20} />}
      </button>
    </div>
  );
}
