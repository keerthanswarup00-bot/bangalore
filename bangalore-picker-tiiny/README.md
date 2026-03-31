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

## Auto Publish To GitHub

You now have automation helper files in the project root:

- `/Users/amanswaroop/Documents/New project/publish.sh`
- `/Users/amanswaroop/Documents/New project/auto-push.sh`
- `/Users/amanswaroop/Documents/New project/watch-and-push.sh`
- `/Users/amanswaroop/Documents/New project/com.bangalorepicker.autopush.plist`

### Safest option: manual publish

Run:

```bash
/Users/amanswaroop/Documents/New\ project/publish.sh
```

This will:

- rebuild the delivery files
- rebuild the Tiiny version
- rebuild the zip files
- `git add`, `commit`, and `push`

### One-time GitHub remote setup

This repo currently has no `origin` remote yet. Add it once:

```bash
cd "/Users/amanswaroop/Documents/New project"
git remote add origin <YOUR_GITHUB_REPO_URL>
git push -u origin main
```

After that, `publish.sh` will push automatically every time you run it.

### Fully automatic push on file changes

Install `fswatch`:

```bash
brew install fswatch
```

Then start the watcher:

```bash
/Users/amanswaroop/Documents/New\ project/watch-and-push.sh
```

### Auto-start watcher on Mac login

Copy the launch agent:

```bash
cp "/Users/amanswaroop/Documents/New project/com.bangalorepicker.autopush.plist" ~/Library/LaunchAgents/
launchctl unload ~/Library/LaunchAgents/com.bangalorepicker.autopush.plist 2>/dev/null || true
launchctl load ~/Library/LaunchAgents/com.bangalorepicker.autopush.plist
```

### Recommendation

Use `publish.sh` as your main workflow first. It is much safer than auto-pushing every single save while you are still editing.
