// src/store/store.js
import { configureStore } from "@reduxjs/toolkit";
import searchReducer from "../features/search/searchSlice";
import { slidersApi } from "../features/slidersApi"; 
import { categoriesApi } from "../features/categoriesApi";
import { pagesApi } from "../features/pagesApi";
export const store = configureStore({
  reducer: {
    search: searchReducer,
    [slidersApi.reducerPath]: slidersApi.reducer, 
    [categoriesApi.reducerPath]: categoriesApi.reducer,
    [pagesApi.reducerPath]: pagesApi.reducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware()
      .concat(slidersApi.middleware)
      .concat(pagesApi.middleware)
      .concat(categoriesApi.middleware),
});

export default store;
