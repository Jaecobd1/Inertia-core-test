import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  plugins: [tailwindcss(), react()],
  resolve: {
    alias: {
      "@": "/src",
    },
  },
  build: {
    emptyOutDir: true,
    outDir: "../wwwroot/dist",
  },
  server: {
    port: 44404,
    strictPort: true,
    hmr: {
      port: 44404,
    },
  },
});
