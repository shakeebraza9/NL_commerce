// src/features/cartSlice.js
import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  cartItems: [], // { id, name, price, quantity, stock }
  subtotal: 0,
  deliveryCharges: 200, // example fixed charges
  total: 0,
};

const cartSlice = createSlice({
  name: "cart",
  initialState,
  reducers: {
    addToCart: (state, action) => {
      const { id, quantity, stock } = action.payload;
      const existingItem = state.cartItems.find((item) => item.id === id);

      if (existingItem) {
        if (existingItem.quantity + quantity <= stock) {
          existingItem.quantity += quantity;
        }
      } else {
        if (quantity <= stock) {
          state.cartItems.push(action.payload);
        }
      }

      // subtotal calculate
      state.subtotal = state.cartItems.reduce(
        (acc, item) => acc + item.price * item.quantity,
        0
      );
      // total calculate
      state.total = state.subtotal + state.deliveryCharges;
    },

    removeFromCart: (state, action) => {
      state.cartItems = state.cartItems.filter(
        (item) => item.id !== action.payload
      );

      state.subtotal = state.cartItems.reduce(
        (acc, item) => acc + item.price * item.quantity,
        0
      );
      state.total = state.subtotal + state.deliveryCharges;
    },

    clearCart: (state) => {
      state.cartItems = [];
      state.subtotal = 0;
      state.total = 0 + state.deliveryCharges;
    },

    increaseQty: (state, action) => {
      const item = state.cartItems.find((i) => i.id === action.payload);
      if (item && item.quantity < item.stock) {
        item.quantity++;
      }
      state.subtotal = state.cartItems.reduce(
        (acc, i) => acc + i.price * i.quantity,
        0
      );
      state.total = state.subtotal + state.deliveryCharges;
    },

    decreaseQty: (state, action) => {
      const item = state.cartItems.find((i) => i.id === action.payload);
      if (item && item.quantity > 1) {
        item.quantity--;
      }
      state.subtotal = state.cartItems.reduce(
        (acc, i) => acc + i.price * i.quantity,
        0
      );
      state.total = state.subtotal + state.deliveryCharges;
    },
  },
});

export const {
  addToCart,
  removeFromCart,
  clearCart,
  increaseQty,
  decreaseQty,
} = cartSlice.actions;
export default cartSlice.reducer;
