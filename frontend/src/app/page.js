import Carousel from "@/components/pages/Carousel";
import CategoryCards from "@/components/pages/CategoryCards";
import ReviewSection from "@/components/pages/ReviewSection";
import PopularProducts from "@/components/pages/PopularProducts";
import SupportSection from "@/components/SupportSection"; 
import Loader from "@/components/Loader";

export default function Page() {
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
