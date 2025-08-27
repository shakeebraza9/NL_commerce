// src/store/store.js
import { configureStore } from "@reduxjs/toolkit";
import searchReducer from "../features/search/searchSlice";
import { slidersApi } from "../features/slidersApi"; 
import { categoriesApi } from "../features/categoriesApi";
import { pagesApi } from "../features/pagesApi";
import cartReducer from "../features/cartSlice"; 
import { stockApi } from "../features/stockApi";

export const store = configureStore({
  reducer: {
    search: searchReducer,
    [slidersApi.reducerPath]: slidersApi.reducer, 
    [categoriesApi.reducerPath]: categoriesApi.reducer,
    [stockApi.reducerPath]: stockApi.reducer,
    [pagesApi.reducerPath]: pagesApi.reducer,
    cart: cartReducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware()
      .concat(slidersApi.middleware)
      .concat(pagesApi.middleware)
      .concat(stockApi.middleware)
      .concat(categoriesApi.middleware), 
});

export default store;
