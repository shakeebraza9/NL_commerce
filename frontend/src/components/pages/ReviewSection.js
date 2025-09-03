"use client"

import { Swiper, SwiperSlide } from "swiper/react"
import { Pagination, Autoplay } from "swiper/modules"
import "swiper/css"
import "swiper/css/pagination"
import { useGetHomeReviewsQuery } from "@/features/reviewsApi"
import { motion } from "framer-motion"
export default function ReviewSection() {
  const { data, isLoading, isError } = useGetHomeReviewsQuery()

if (isLoading) {
  return (
    <div className="flex items-center justify-center py-20 bg-white">
      <div className="flex flex-col items-center">
        {/* Spinner */}
        <div className="w-12 h-12 border-4 border-yellow-400 border-t-transparent rounded-full animate-spin"></div>
        
        {/* Text */}
        <p className="mt-4 text-gray-700 font-medium animate-pulse">
          Loading reviews...
        </p>
      </div>
    </div>
  )
}


  if (isError) {
    return (
      <div className="py-20 bg-white">
        <p className="text-center text-red-600">Failed to load reviews.</p>
      </div>
    )
  }

  const reviews = data?.data || []

  return (
    <section className="py-20 bg-white">
      <div className="max-w-6xl mx-auto px-4">
        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
          className="text-center mb-16"
        >
          <h2 className="text-4xl md:text-5xl font-bold text-black mb-4">What Our Clients Say</h2>
          <div className="w-24 h-1 bg-yellow-400 mx-auto rounded-full"></div>
        </motion.div>

        {/* Reviews Carousel */}
        <Swiper
          modules={[Pagination, Autoplay]}
          pagination={{
            clickable: true,
            bulletActiveClass: "swiper-pagination-bullet-active !bg-yellow-400",
            bulletClass: "swiper-pagination-bullet !bg-gray-300",
          }}
          autoplay={{ delay: 5000, disableOnInteraction: false }}
          loop={true}
          spaceBetween={30}
          breakpoints={{
            0: { slidesPerView: 1 },
            768: { slidesPerView: 2 },
            1024: { slidesPerView: 3 },
          }}
          className="w-full pb-12"
        >
          {reviews.map((review, index) => (
            <SwiperSlide key={review.id}>
              <motion.div
                initial={{ opacity: 0, y: 30 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.6, delay: index * 0.1 }}
                className="bg-white border-2 border-gray-100 rounded-2xl p-8 shadow-lg hover:shadow-xl hover:border-yellow-400 transition-all duration-300 group h-full"
              >
                {/* Quote Icon */}
                <div className="flex justify-center mb-6">
                  <div className="w-12 h-12 bg-yellow-400 rounded-full flex items-center justify-center">
                    <span className="text-white text-2xl font-bold">"</span>
                  </div>
                </div>

                {/* Review Text */}
                <p className="text-gray-700 text-center mb-8 leading-relaxed text-lg italic">"{review.review}"</p>

                {/* Rating */}
                <div className="flex justify-center mb-6">
                  {Array.from({ length: 5 }).map((_, i) => (
                    <motion.span
                      key={i}
                      initial={{ scale: 0 }}
                      animate={{ scale: 1 }}
                      transition={{ delay: 0.3 + i * 0.05 }}
                      className={`text-2xl mx-1 ${i < review.star ? "text-yellow-400" : "text-gray-300"}`}
                    >
                      ★
                    </motion.span>
                  ))}
                </div>

                {/* Customer Info */}
                <div className="flex items-center justify-center gap-4">
                  <img
                    src={`https://ui-avatars.com/api/?name=${encodeURIComponent(
                      review.name,
                    )}&background=fbbf24&color=ffffff&size=64`}
                    alt={review.name}
                    className="w-16 h-16 rounded-full border-3 border-yellow-400 shadow-md group-hover:scale-105 transition-transform duration-300"
                  />
                  <div className="text-center">
                    <h3 className="font-bold text-lg text-black">{review.name}</h3>
                    <p className="text-sm text-gray-600 font-medium">Verified Customer</p>
                  </div>
                </div>

                {/* Decorative Element */}
                <div className="absolute top-4 right-4 w-8 h-8 bg-yellow-100 rounded-full opacity-50 group-hover:opacity-100 transition-opacity duration-300"></div>
              </motion.div>
            </SwiperSlide>
          ))}
        </Swiper>

    
      </div>

      <style jsx global>{`
        .swiper-pagination-bullet {
          width: 12px !important;
          height: 12px !important;
          margin: 0 6px !important;
        }
        .swiper-pagination-bullet-active {
          transform: scale(1.2) !important;
        }
      `}</style>
    </section>
  )
}
