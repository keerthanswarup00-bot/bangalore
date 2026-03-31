# Bangalore Picker

Static Bangalore random place picker, ready for GitHub Pages.

## Files

- `index.html`: main app file for GitHub Pages
- `bangalore_random_picker.html`: same app file kept with the original name
- `.nojekyll`: tells GitHub Pages to serve the site as plain static files
- `places-extra.js`: optional bulk dataset file loaded automatically by the app
- `places-extra.sample.js`: sample format for large imports

## Publish On GitHub Pages

1. Push this folder to a GitHub repository.
2. Open the repository on GitHub.
3. Go to `Settings` -> `Pages`.
4. Under `Build and deployment`, choose:
   - `Source`: `Deploy from a branch`
   - `Branch`: `main` (or your default branch)
   - `Folder`: `/ (root)`
5. Save.
6. GitHub will give you a public URL like:
   `https://yourusername.github.io/repository-name/`

## Enable Owner-Only Analytics

The app supports Google Analytics 4.

Open `index.html` and `bangalore_random_picker.html`, then set:

```js
const APP_CONFIG = {
  PUBLIC_SITE_URL: "https://yourusername.github.io/repository-name/",
  GA_MEASUREMENT_ID: "G-XXXXXXXXXX"
};
```

Notes:

- `PUBLIC_SITE_URL` makes the in-app share button generate public app links.
- `GA_MEASUREMENT_ID` enables Google Analytics 4 tracking for visits.
- The analytics dashboard is visible only to accounts you allow in your GA4 property.

## Add 1000+ More Places

The app now supports a separate bulk file:

- `places-extra.js`

Format:

```js
window.EXTRA_PLACES = [
  {
    name: "Place name",
    cat: "Food & Cafes",
    desc: "Short description",
    budget: "₹200–400/person",
    dist: "Indiranagar",
    type: "Café"
  }
];
```

Valid categories:

- `Food & Cafes`
- `Parks & Nature`
- `Heritage & Temples`
- `Scenic & Viewpoints`
- `Long Rides`
- `Activities`
- `Culture & Art`
- `Markets & Streets`
- `Hidden Gems`

If you give me a real list of 1000+ Bangalore places, I can now load it directly into `places-extra.js` without changing the app structure.

## Official GA4 Setup

- Google Analytics help:
  https://support.google.com/analytics/answer/9304153?hl=en
