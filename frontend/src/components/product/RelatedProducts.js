import CleanProduct from "../shop/CleanProduct";

export default function RelatedProducts({ products }) {
    return (
        <div className="border-t pt-8">
            <h3 className="text-2xl font-bold mb-6">Related Products</h3>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                {products.map((product) => (
                    <CleanProduct key={product.id} product={product} />
                ))}
            </div>
        </div>
    );
}
