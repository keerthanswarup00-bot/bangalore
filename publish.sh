#!/bin/zsh
set -euo pipefail

ROOT="/Users/amanswaroop/Documents/New project"
OTHERS_DIR="$ROOT/others"
TIINY_DIR="$ROOT/bangalore-picker-tiiny"
DELIVERY_DIR="$OTHERS_DIR/bangalore-picker-delivery"

echo "Publishing Bangalore Picker..."

mkdir -p "$DELIVERY_DIR"

cp "$OTHERS_DIR/bangalore_random_picker.html" "$OTHERS_DIR/index.html"
cp "$OTHERS_DIR/bangalore_random_picker.html" "$DELIVERY_DIR/bangalore_random_picker.html"
cp "$OTHERS_DIR/bangalore_random_picker.html" "$DELIVERY_DIR/index.html"
cp "$OTHERS_DIR/places-extra.js" "$DELIVERY_DIR/places-extra.js"
cp "$OTHERS_DIR/favicon.svg" "$DELIVERY_DIR/favicon.svg"
cp "$OTHERS_DIR/social-preview.svg" "$DELIVERY_DIR/social-preview.svg"

node - <<'NODE'
const fs = require('fs');
const htmlPath = '/Users/amanswaroop/Documents/New project/others/bangalore_random_picker.html';
const extraPath = '/Users/amanswaroop/Documents/New project/others/places-extra.js';
const tiinyPath = '/Users/amanswaroop/Documents/New project/bangalore-picker-tiiny/index.html';
const html = fs.readFileSync(htmlPath, 'utf8');
const extra = fs.readFileSync(extraPath, 'utf8').trim();
const inlineHtml = html.replace(/<script src="\.\/places-extra\.js"><\/script>/, `<script>\n${extra}\n</script>`);
fs.writeFileSync(tiinyPath, inlineHtml);
NODE

cp "$OTHERS_DIR/favicon.svg" "$TIINY_DIR/favicon.svg"
cp "$OTHERS_DIR/social-preview.svg" "$TIINY_DIR/social-preview.svg"
cp "$OTHERS_DIR/README.md" "$TIINY_DIR/README.md"

rm -f "$ROOT/bangalore-picker-tiiny.zip" "$OTHERS_DIR/bangalore-picker-delivery.zip" "$OTHERS_DIR/bangalore_random_picker.zip"

cd "$ROOT"
zip -r "bangalore-picker-tiiny.zip" "bangalore-picker-tiiny" >/dev/null
zip -r "others/bangalore-picker-delivery.zip" "others/bangalore-picker-delivery" >/dev/null
zip -j "others/bangalore_random_picker.zip" \
  "others/bangalore_random_picker.html" \
  "others/index.html" \
  "others/places-extra.js" \
  "others/README.md" \
  "others/favicon.svg" \
  "others/social-preview.svg" \
  ".nojekyll" >/dev/null

git add .

if git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

git commit -m "publish: $(date '+%Y-%m-%d %H:%M:%S')"

if git remote get-url origin >/dev/null 2>&1; then
  git push -u origin main
  echo "Publish complete and pushed to GitHub."
else
  echo "Publish complete locally."
  echo "Next step: add your GitHub remote once with:"
  echo "git remote add origin <YOUR_GITHUB_REPO_URL>"
  echo "git push -u origin main"
fi
