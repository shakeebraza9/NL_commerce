import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

export const reviewsSlice = createApi({
  reducerPath: "reviewsSlice",
  baseQuery: fetchBaseQuery({ baseUrl: `${process.env.NEXT_PUBLIC_BASE_URL}` }),
  tagTypes: ["Reviews"],
  endpoints: (builder) => ({
    addReview: builder.mutation({
      query: (newReview) => ({
        url: "reviews",
        method: "POST",
        body: newReview,
      }),
      invalidatesTags: ["Reviews"],
    }),
    getReviews: builder.query({
      query: (productId) => `reviews?product_id=${productId}`,
      providesTags: ["Reviews"],
    }),
  }),
});

export const { useAddReviewMutation, useGetReviewsQuery } = reviewsSlice;
