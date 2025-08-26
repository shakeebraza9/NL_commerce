import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

export const slidersApi = createApi({
  reducerPath: "slidersApi",
  baseQuery: fetchBaseQuery({ baseUrl: process.env.NEXT_PUBLIC_BASE_URL }),
  endpoints: (builder) => ({
    getSliders: builder.query({
      query: () => "/sliders",
    }),
  }),
});

export const { useGetSlidersQuery } = slidersApi;
