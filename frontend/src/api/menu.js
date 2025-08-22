import { useState, useEffect } from "react"

export const menuFetch = async (id) => {
    try {
        const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/menu/${id}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
            },
        });

        if (!res.ok) {
            throw new Error("Failed to fetch menu data");
        }

        return await res.json();
    } catch (error) {
        console.error("Menu fetch error:", error);
        return null;
    }
};

