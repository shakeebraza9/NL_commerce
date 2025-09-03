"use client";
import { useEffect, useRef } from "react";
import AboutHero from "@/components/about/AboutHero"
import AboutStats from "@/components/about/AboutStats"
import AboutFeatures from "@/components/about/AboutFeatures"
import AboutTeam from "@/components/about/AboutTeam"
import AboutCTA from "@/components/about/AboutCTA"
import { useTrackActivityMutation } from "@/features/trackActivityApi";
export default function About() {
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
          page_name: "About-us",
          ip_address: ip,
        });
      } catch (error) {
        console.error("Tracking failed", error);
      }
    }

    logActivity();
  }, [trackActivity]);

    return (
        <div className="min-h-screen bg-base-white dark:bg-base-black dark:text-base-white">
            <AboutHero />
            <AboutStats />
            <AboutFeatures />
            <AboutTeam />
            <AboutCTA />
        </div>
    )
}
