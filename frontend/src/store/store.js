// src/store/store.js
import { configureStore } from "@reduxjs/toolkit"
import { persistStore, persistReducer } from "redux-persist"
import storage from "redux-persist/lib/storage" 
import searchReducer from "../features/search/searchSlice"
import { slidersApi } from "../features/slidersApi"
import { categoriesApi } from "../features/categoriesApi"
import { pagesApi } from "../features/pagesApi"
import cartReducer from "../features/cartSlice"
import { stockApi } from "../features/stockApi"
import settingsReducer from "../features/settingsSlice"
import { reviewsApi } from "../features/reviewsApi";
import { reviewsSlice } from "../features/reviewsSlice"
import { trackActivityApi } from "../features/trackActivityApi";
const cartPersistConfig = {
  key: "cart",
  storage,
}

const persistedCartReducer = persistReducer(cartPersistConfig, cartReducer)

export const store = configureStore({
  reducer: {
    search: searchReducer,
    [slidersApi.reducerPath]: slidersApi.reducer,
    [categoriesApi.reducerPath]: categoriesApi.reducer,
    [stockApi.reducerPath]: stockApi.reducer,
    [pagesApi.reducerPath]: pagesApi.reducer,
    [reviewsApi.reducerPath]: reviewsApi.reducer,
    [reviewsSlice.reducerPath]: reviewsSlice.reducer,
    [trackActivityApi.reducerPath]: trackActivityApi.reducer,
    cart: persistedCartReducer, 
    settings: settingsReducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: false, 
    })
      .concat(slidersApi.middleware)
      .concat(pagesApi.middleware)
      .concat(reviewsApi.middleware)
      .concat(stockApi.middleware)
      .concat(reviewsSlice.middleware) 
      .concat(trackActivityApi.middleware)
      .concat(categoriesApi.middleware),
})

export const persistor = persistStore(store)
export default store
