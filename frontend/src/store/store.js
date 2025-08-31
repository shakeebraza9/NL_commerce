// src/store/store.js
import { configureStore } from "@reduxjs/toolkit"
import { persistStore, persistReducer } from "redux-persist"
import storage from "redux-persist/lib/storage" // localStorage use karega
import searchReducer from "../features/search/searchSlice"
import { slidersApi } from "../features/slidersApi"
import { categoriesApi } from "../features/categoriesApi"
import { pagesApi } from "../features/pagesApi"
import cartReducer from "../features/cartSlice"
import { stockApi } from "../features/stockApi"
import settingsReducer from "../features/settingsSlice"

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
    cart: persistedCartReducer, // ✅ cart persist ho raha hai
    settings: settingsReducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: false, // redux-persist ke liye zaroori hai
    })
      .concat(slidersApi.middleware)
      .concat(pagesApi.middleware)
      .concat(stockApi.middleware)
      .concat(categoriesApi.middleware),
})

export const persistor = persistStore(store)
export default store
