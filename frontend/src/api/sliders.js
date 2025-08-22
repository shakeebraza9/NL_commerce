export const slidersFetch = async () => {
    try {
        const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/sliders`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
            cache: "no-store",
        });

        if (!res.ok) {
            throw new Error("Failed to fetch sliders data");
        }

        return await res.json();
    } catch (error) {
        console.error("Sliders fetch error:", error);
        return null;
    }
};
