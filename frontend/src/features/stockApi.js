// src/features/stockApi.js
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

export const stockApi = createApi({
  reducerPath: "stockApi",
  baseQuery: fetchBaseQuery({ baseUrl: `${process.env.NEXT_PUBLIC_BASE_URL}` }),
  endpoints: (builder) => ({
    checkStock: builder.query({
      query: ({ productId, variationId, quantity }) =>
        `/products/${productId}/stock?variation_id=${variationId}&quantity=${quantity}`,
    }),
  }),
});

export const { useCheckStockQuery } = stockApi;
