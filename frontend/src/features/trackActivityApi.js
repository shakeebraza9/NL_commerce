import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

export const trackActivityApi = createApi({
  reducerPath: "trackActivityApi",
  baseQuery: fetchBaseQuery({
    baseUrl: `${process.env.NEXT_PUBLIC_BASE_URL}`,
  }),
  endpoints: (builder) => ({
    trackActivity: builder.mutation({
      query: ({ page_name, ip_address }) => ({
        url: "track-activity",
        method: "POST",
        body: { page_name, ip_address },
      }),
    }),
  }),
});

export const { useTrackActivityMutation } = trackActivityApi;
