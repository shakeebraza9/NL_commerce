// src/app/layout.js
import Header from "../components/Header";
import Footer from "../components/Footer";
import "./globals.css";
import { ThemeProvider } from "next-themes";
import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import { Toaster } from "react-hot-toast"
export default function RootLayout({ children }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body>
        <ThemeProvider attribute="class" defaultTheme="light">
          <Header />
          <main className="bg-base-white text-base-black dark:bg-base-black dark:text-base-white min-h-screen transition-colors duration-300">
            {children}
          </main>
          <Footer />
        </ThemeProvider>
        <Toaster position="top-right" reverseOrder={false} />
      </body>
    </html>
  );
}
