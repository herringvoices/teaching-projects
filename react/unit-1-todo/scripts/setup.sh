#!/usr/bin/env bash
set -euo pipefail

# Prompt for directory name
while true; do
  echo "Enter a name for the new project directory (no spaces):"
  read -r DIR_NAME || { echo "No input provided."; exit 1; }

  if [[ -z "${DIR_NAME}" ]]; then
    echo "Name cannot be empty."
    continue
  fi
  if [[ "${DIR_NAME}" =~ [[:space:]] ]]; then
    echo "Name must not contain spaces."
    continue
  fi
  break
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${SCRIPT_DIR}/${DIR_NAME}"

# Ensure target doesn't already exist
if [[ -e "${TARGET_DIR}" ]]; then
  echo "Error: '${TARGET_DIR}' already exists. Choose a different name."
  exit 1
fi

# Create project directory
mkdir -p "${TARGET_DIR}"

# Write files using echo
# index.html
> "${TARGET_DIR}/index.html"
echo '<!DOCTYPE html>' >> "${TARGET_DIR}/index.html"
echo '<html lang="en">' >> "${TARGET_DIR}/index.html"
echo '<head>' >> "${TARGET_DIR}/index.html"
echo '  <meta charset="UTF-8" />' >> "${TARGET_DIR}/index.html"
echo '  <meta name="viewport" content="width=device-width, initial-scale=1.0" />' >> "${TARGET_DIR}/index.html"
echo '  <title>React App</title>' >> "${TARGET_DIR}/index.html"

echo '' >> "${TARGET_DIR}/index.html"
echo '  <!-- Bootstrap CSS -->' >> "${TARGET_DIR}/index.html"
echo '  <link' >> "${TARGET_DIR}/index.html"
echo '    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"' >> "${TARGET_DIR}/index.html"
echo '    rel="stylesheet"' >> "${TARGET_DIR}/index.html"
echo '    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"' >> "${TARGET_DIR}/index.html"
echo '    crossorigin="anonymous"' >> "${TARGET_DIR}/index.html"
echo '  >' >> "${TARGET_DIR}/index.html"

echo '' >> "${TARGET_DIR}/index.html"
echo '  <!-- Font Awesome -->' >> "${TARGET_DIR}/index.html"
echo '  <link' >> "${TARGET_DIR}/index.html"
echo '    rel="stylesheet"' >> "${TARGET_DIR}/index.html"
echo '    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"' >> "${TARGET_DIR}/index.html"
echo '    crossorigin="anonymous"' >> "${TARGET_DIR}/index.html"
echo '    referrerpolicy="no-referrer"' >> "${TARGET_DIR}/index.html"
echo '  />' >> "${TARGET_DIR}/index.html"

echo '' >> "${TARGET_DIR}/index.html"
echo '  <!-- Custom Styles -->' >> "${TARGET_DIR}/index.html"
echo '  <link rel="stylesheet" href="./styles.css">' >> "${TARGET_DIR}/index.html"

echo '' >> "${TARGET_DIR}/index.html"
echo '  <!-- React 17 -->' >> "${TARGET_DIR}/index.html"
echo '  <script src="https://unpkg.com/react@17/umd/react.production.min.js" crossorigin></script>' >> "${TARGET_DIR}/index.html"
echo '  <script src="https://unpkg.com/react-dom@17/umd/react-dom.production.min.js" crossorigin></script>' >> "${TARGET_DIR}/index.html"

echo '' >> "${TARGET_DIR}/index.html"
echo '  <!-- Babel (for JSX in external scripts) -->' >> "${TARGET_DIR}/index.html"
echo '  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>' >> "${TARGET_DIR}/index.html"
echo '</head>' >> "${TARGET_DIR}/index.html"
echo '<body>' >> "${TARGET_DIR}/index.html"
echo '  <div id="app"></div>' >> "${TARGET_DIR}/index.html"

echo '  <!-- External App code -->' >> "${TARGET_DIR}/index.html"
echo '  <script type="text/babel" data-presets="env,react" src="./App.js"></script>' >> "${TARGET_DIR}/index.html"

echo '  <!-- Bootstrap JS Bundle (needed for dropdowns, modals, etc.) -->' >> "${TARGET_DIR}/index.html"
echo '  <script' >> "${TARGET_DIR}/index.html"
echo '    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"' >> "${TARGET_DIR}/index.html"
echo '    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"' >> "${TARGET_DIR}/index.html"
echo '    crossorigin="anonymous">' >> "${TARGET_DIR}/index.html"
echo '  </script>' >> "${TARGET_DIR}/index.html"
echo '</body>' >> "${TARGET_DIR}/index.html"
echo '</html>' >> "${TARGET_DIR}/index.html"

# App.js
> "${TARGET_DIR}/App.js"
echo '// App.js — Blank starter React component with Bootstrap + Font Awesome available' >> "${TARGET_DIR}/App.js"
echo 'function App() {' >> "${TARGET_DIR}/App.js"
echo '  // TODO: Build your React app here' >> "${TARGET_DIR}/App.js"
echo '  return (' >> "${TARGET_DIR}/App.js"
echo '    <>' >> "${TARGET_DIR}/App.js"
echo '' >> "${TARGET_DIR}/App.js"
echo '    </>' >> "${TARGET_DIR}/App.js"
echo '  );' >> "${TARGET_DIR}/App.js"
echo '}' >> "${TARGET_DIR}/App.js"
echo '' >> "${TARGET_DIR}/App.js"
echo '// Mount the app' >> "${TARGET_DIR}/App.js"
echo 'ReactDOM.render(<App />, document.getElementById("app"));' >> "${TARGET_DIR}/App.js"

# styles.css (empty placeholder)
: > "${TARGET_DIR}/styles.css"

echo "Project created at: ${TARGET_DIR}"

# Open the new directory in VS Code
if command -v code >/dev/null 2>&1; then
  code "${TARGET_DIR}"
else
  echo "VS Code command 'code' not found on PATH. Open the folder manually in VS Code."
fi