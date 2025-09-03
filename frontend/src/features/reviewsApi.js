import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

export const reviewsApi = createApi({
  reducerPath: "reviewsApi",
  baseQuery: fetchBaseQuery({ baseUrl: `${process.env.NEXT_PUBLIC_BASE_URL}` }),
  endpoints: (builder) => ({
    getHomeReviews: builder.query({
      query: () => "reviews/home",
    }),
  }),
});

export const { useGetHomeReviewsQuery } = reviewsApi;
