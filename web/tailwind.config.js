module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: { 
      colors: {
      "primary": "#FFFFFF",
      "secondary": {
        "main": "#ff7530",
        "100": "#ffac82",
        "200": "#ff9e6e",
        "300": "#ff9059",
        "400": "#ff8244",
        "500": "#ff7530",
        "600": "#e5692b",
        "700": "#cc5d26",
        "800": "#b25121",
        "900": "#99461c",
      },
      "tertiary": {
        "main": "#FED480",
        "100": "#fee5b2",
        "200": "#fee0a6",
        "300": "#fedc99",
        "400": "#fed88c",
        "500": "#fed480",
        "600": "#e4be73",
        "700": "#cba966",
        "800": "#b19459",
        "900": "#987f4c",
      },
      "dark": {
        "main": "#010101",
        "hover": "#1a1a1a"
      },
      "light": "#F3f3f3"
    },},
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/line-clamp'),
  ],
}
