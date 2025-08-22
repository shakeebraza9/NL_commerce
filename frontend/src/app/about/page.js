import AboutHero from "@/components/about/AboutHero"
import AboutStats from "@/components/about/AboutStats"
import AboutFeatures from "@/components/about/AboutFeatures"
import AboutTeam from "@/components/about/AboutTeam"
import AboutCTA from "@/components/about/AboutCTA"

export default function About() {
    return (
        <div className="min-h-screen bg-white">
            <AboutHero />
            <AboutStats />
            <AboutFeatures />
            <AboutTeam />
            <AboutCTA />
        </div>
    )
}
