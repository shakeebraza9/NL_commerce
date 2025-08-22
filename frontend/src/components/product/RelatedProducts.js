import CleanProduct from "../shop/CleanProduct";

export default function RelatedProducts({ products }) {
    // products ko clean / transform kar diya
    const mappedProducts = (products && Array.isArray(products))
        ? products.map((item) => ({
            id: item.id,
            slug: item.slug,
            name: item.title,
            image: `${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.image}`,
            hoverImage: item.hover_image 
                ? `${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.hover_image}` 
                : `${process.env.NEXT_PUBLIC_WEB_BASE_URL}${item.image}`,
            originalPrice: item.selling_price,
            discountPrice: item.price,
            rating: 4.5,
            reviews: 120,
        }))
        : [];

    return (
        <div className="border-t pt-8">
            <h3 className="text-2xl font-bold mb-6">Related Products</h3>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                {mappedProducts.map((product) => (
                    <CleanProduct key={product.id} product={product} />
                ))}
            </div>
        </div>
    );
}
