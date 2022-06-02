module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: { 
      colors: {
      "primary": "#FFFFFF",
      "white": "#FFFFFF",
      "secondary": {
        "main": "#FED480",
        "dark": "#e4be73"
      },
      "tertiary": {
        "main": "#FF7530",
        "dark": "#e5692b",
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
  ],
}
