"use client";

import { Swiper, SwiperSlide } from "swiper/react";
import { Pagination, Autoplay } from "swiper/modules";
import "swiper/css";
import "swiper/css/pagination";

const reviews = [
    {
        id: 1,
        name: "Sarah Johnson",
        role: "Marketing Manager",
        comment: "This service is amazing! Highly recommend to everyone.",
        rating: 5,
        image: "https://randomuser.me/api/portraits/women/44.jpg",
    },
    {
        id: 2,
        name: "Michael Smith",
        role: "Software Engineer",
        comment: "Great experience, very professional and quick response.",
        rating: 4,
        image: "https://randomuser.me/api/portraits/men/46.jpg",
    },
    {
        id: 3,
        name: "Emily Davis",
        role: "Entrepreneur",
        comment: "Loved the quality of work, will definitely use again!",
        rating: 5,
        image: "https://randomuser.me/api/portraits/women/55.jpg",
    },
    {
        id: 4,
        name: "David Wilson",
        role: "Business Owner",
        comment: "Professional, quick, and exceeded expectations!",
        rating: 5,
        image: "https://randomuser.me/api/portraits/men/62.jpg",
    },
    {
        id: 5,
        name: "Sophia Lee",
        role: "Designer",
        comment: "Creative and very responsive team. Loved working with them.",
        rating: 5,
        image: "https://randomuser.me/api/portraits/women/68.jpg",
    },
];

export default function ReviewSection() {
    return (
        <section className="py-24 bg-gradient-to-b bg-base-white dark:bg-base-black dark:text-base-white">
            <div className="max-w-6xl mx-auto px-4">
                <h2 className="text-4xl md:text-5xl font-extrabold text-center mb-16 ">
                    What Our Clients Say
                </h2>

                <Swiper
                    modules={[Pagination, Autoplay]}
                    pagination={{ clickable: true }}
                    autoplay={{ delay: 4000 }}
                    loop={true}
                    spaceBetween={40}
                    breakpoints={{
                        0: { slidesPerView: 1 },
                        768: { slidesPerView: 1 },
                        1024: { slidesPerView: 2 },
                    }}
                    className="w-full"
                >
                    {reviews.map((review) => (
                        <SwiperSlide key={review.id}>
                            <div className="relative bg-white p-8 rounded-3xl shadow-lg hover:shadow-xl transition-transform duration-500 transform hover:-translate-y-2 border-2 border-yellow-300">
                                {/* Quote Icon */}
                                <span className="absolute -top-5 -left-5 text-6xl text-yellow-100 select-none">“</span>

                                {/* Comment */}
                                <p className="text-gray-900 italic mb-8 leading-relaxed text-lg">{review.comment}</p>

                                <div className="flex items-center gap-5">
                                    {/* Profile */}
                                    <img
                                        src={review.image}
                                        alt={review.name}
                                        className="w-16 h-16 rounded-full border-2 border-yellow-400 shadow-md"
                                    />

                                    <div>
                                        <h3 className="font-bold text-lg text-gray-900">{review.name}</h3>
                                        <p className="text-sm text-gray-600">{review.role}</p>

                                        {/* Rating */}
                                        <div className="flex mt-1">
                                            {Array.from({ length: 5 }).map((_, i) => (
                                                <span
                                                    key={i}
                                                    className={`text-xl ${i < review.rating ? "text-yellow-400" : "text-gray-300"}`}
                                                >
                                                    ★
                                                </span>
                                            ))}
                                        </div>
                                    </div>
                                </div>

                                {/* Speech bubble effect */}
                                <div className="absolute -bottom-4 left-12 w-5 h-5 bg-white transform rotate-45 border-l border-b border-yellow-300"></div>
                            </div>
                        </SwiperSlide>
                    ))}
                </Swiper>
            </div>
        </section>
    );
}
