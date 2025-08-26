import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

export const pagesApi = createApi({
  reducerPath: "pagesApi",
  baseQuery: fetchBaseQuery({ baseUrl: process.env.NEXT_PUBLIC_BASE_URL }),
  endpoints: (builder) => ({
    getPage: builder.query({
      query: (slug) => `pages/${slug}`,
    }),
  }),
});

export const { useGetPageQuery } = pagesApi;
