export async function getGlobalSettings() {
    try {
        const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/settings`, {
            cache: "no-store",
        });
        const data = await res.json();

        if (data.status) {
            const settings = {};
            data.data.forEach((item) => {
                settings[item.field] = item.value;
            });
            return settings;
        }
        return {};
    } catch (error) {
        console.error("Error fetching global settings:", error);
        return {};
    }
}
