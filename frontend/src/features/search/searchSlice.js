import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";

export const fetchProducts = createAsyncThunk(
  "search/fetchProducts",
  async (query) => {
    if (!query || query.trim().length <= 1) return [];
    const res = await fetch(`${process.env.NEXT_PUBLIC_BASE_URL}/products/search?title=${query}`);
    const data = await res.json();
    return data.data || [];
  }
);

const searchSlice = createSlice({
  name: "search",
  initialState: {
    query: "",
    results: [],
    loading: false,
    showResults: false,
  },
  reducers: {
    setQuery: (state, action) => {
      state.query = action.payload;
      state.showResults = action.payload.trim().length > 1;
    },
    clearSearch: (state) => {
      state.query = "";
      state.results = [];
      state.showResults = false;
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(fetchProducts.pending, (state) => {
        state.loading = true;
      })
      .addCase(fetchProducts.fulfilled, (state, action) => {
        state.loading = false;
        state.results = action.payload;
      })
      .addCase(fetchProducts.rejected, (state) => {
        state.loading = false;
        state.results = [];
      });
  },
});

export const { setQuery, clearSearch } = searchSlice.actions;
export default searchSlice.reducer;
