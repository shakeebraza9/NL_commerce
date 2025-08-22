// api/categories.js
export const categoriesFetch = async () => {
    try {
        const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/categories`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
            cache: "no-store",
        });

        if (!res.ok) {
            throw new Error("Failed to fetch categories");
        }

        const result = await res.json();
        return result.data || [];
    } catch (error) {
        console.error("Categories fetch error:", error);
        return [];
    }
};
