import { createSlice, createAsyncThunk } from "@reduxjs/toolkit"
import axios from "axios"

// async thunk for fetching global settings
export const fetchSettings = createAsyncThunk(
  "settings/fetchSettings",
  async () => {
    const res = await axios.get(`${process.env.NEXT_PUBLIC_BASE_URL}/settings`) 
    const data = res.data

    if (data.status && Array.isArray(data.data)) {
      const settings = {}
      data.data.forEach((item) => {
        settings[item.field] = item.value
      })
      return settings
    }

    return {}
  }
)

const settingsSlice = createSlice({
  name: "settings",
  initialState: {
    delivery_charges: 0,
    tax: 0,
    loading: false,
  },
  reducers: {
    setSettings: (state, action) => {
      return { ...state, ...action.payload }
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(fetchSettings.pending, (state) => {
        state.loading = true
      })
      .addCase(fetchSettings.fulfilled, (state, action) => {
        // values string me aati hain → number me convert karna
        state.delivery_charges = Number(action.payload.delivery_charges) || 0
        state.tax = Number(action.payload.tax) || 0
        state.loading = false
      })
      .addCase(fetchSettings.rejected, (state) => {
        state.loading = false
      })
  },
})

export const { setSettings } = settingsSlice.actions
export default settingsSlice.reducer
