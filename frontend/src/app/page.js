"use client";

import { useEffect, useRef } from "react";
import Carousel from "@/components/pages/Carousel";
import CategoryCards from "@/components/pages/CategoryCards";
import ReviewSection from "@/components/pages/ReviewSection";
import PopularProducts from "@/components/pages/PopularProducts";
import SupportSection from "@/components/SupportSection"; 
import Loader from "@/components/Loader";
import { useTrackActivityMutation } from "@/features/trackActivityApi";

export default function Page() {
const [trackActivity] = useTrackActivityMutation();
  const hasTracked = useRef(false); 

  useEffect(() => {
    if (hasTracked.current) return; 
    hasTracked.current = true;

    async function logActivity() {
      try {
        const ip = await fetch("https://api.ipify.org?format=json")
          .then((res) => res.json())
          .then((data) => data.ip);

        await trackActivity({
          page_name: "Home",
          ip_address: ip,
        });
      } catch (error) {
        console.error("Tracking failed", error);
      }
    }

    logActivity();
  }, [trackActivity]);

  return (
    <>
      <Loader />
      <div className="container mx-auto px-4">
        <Carousel />
        <CategoryCards />
        <PopularProducts />
        <ReviewSection />
        <SupportSection />
      </div>
    </>
  );
}
