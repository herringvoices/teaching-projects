#!/usr/bin/env bash
# Build the Sakura's Card Shops project into ./sakuras-cards

set -euo pipefail

BUILD_DIR="sakuras-cards"
SCRIPT_DIR="$BUILD_DIR/scripts"

echo "[build] Rebuilding project into $BUILD_DIR (excluding second.js)"
rm -rf "$BUILD_DIR"
mkdir -p "$SCRIPT_DIR"

echo "[build] Writing index.html"
cat > "$BUILD_DIR/index.html" <<'EOF'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Sakura’s Card Shops</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="./style.css">

    <style>

    </style>
  </head>
  <body>
    <h1>Sakura’s Card Shops</h1>

    <!-- This is where our JS will draw the dropdown and the pack list -->
    <div id="container"></div>

    <!-- Important: module scripts let us use import/export -->
    <script type="module" src="./scripts/main.js"></script>
  </body>
</html>
EOF

echo "[build] Writing style.css"
cat > "$BUILD_DIR/style.css" <<'EOF'
/* =============================
	 Sakura's Card Shops Styling
	 Modern, light, cheerful theme
	 ============================= */

/* CSS Variables (easy theming) */
:root {
	--bg-gradient: radial-gradient(circle at 25% 20%, #ffe7f3, #ffe0fa, #f4e8ff 60%, #e9f5ff);
	--panel-bg: #ffffffcc;
	--panel-border: #ffd1ec;
	--accent: #e9408a;
	--accent-rgb: 233 64 138;
	--accent-soft: #ff9bc5;
	--text-dark: #2d2130;
	--text-mid: #5c4f56;
	--shadow-sm: 0 1px 3px rgba(0 0 0 / .15);
	--shadow-md: 0 4px 18px -2px rgba(0 0 0 / .18);
	--radius-sm: 6px;
	--radius-md: 12px;
	--focus-ring: 0 0 0 3px #fff, 0 0 0 6px var(--accent-soft);
	--font-stack: system-ui, -apple-system, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", Arial, sans-serif;
}

/* Global */
* { box-sizing: border-box; }
body {
	font-family: var(--font-stack);
	line-height: 1.4;
	margin: 0;
	min-height: 100vh;
	padding: clamp(1.25rem, 4vw, 3rem);
	background: var(--bg-gradient) fixed;
	color: var(--text-dark);
	-webkit-font-smoothing: antialiased;
}

h1 {
	margin: 0 0 1.25rem;
	font-size: clamp(1.9rem, 4.5vw, 3rem);
	letter-spacing: .5px;
	background: linear-gradient(90deg, var(--accent), #ff7dba 40%, #ffbde2);
	background-clip: text;
	-webkit-background-clip: text;
	color: transparent;
	font-weight: 700;
	text-shadow: 0 2px 6px rgba(var(--accent-rgb) / .25);
}

/* Main container acts like a soft card */
#container {
	max-width: 720px;
	background: var(--panel-bg);
	backdrop-filter: blur(8px) saturate(1.15);
	border: 2px solid var(--panel-border);
	border-radius: var(--radius-md);
	padding: 1.25rem 1.5rem 1.75rem;
	box-shadow: var(--shadow-md);
	position: relative;
	overflow: hidden;
}

#container:before,
#container:after {
	content: "";
	position: absolute;
	inset: 0;
	pointer-events: none;
	background: linear-gradient(135deg, rgba(var(--accent-rgb) / .08), transparent 55%);
	mix-blend-mode: normal;
}

label {
	font-weight: 600;
	margin-right: .5rem;
	font-size: .95rem;
	letter-spacing: .5px;
	text-transform: uppercase;
	color: var(--text-mid);
}

/* Custom select styling */
select {
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	background: #fff;
	border: 2px solid var(--panel-border);
	border-radius: var(--radius-sm);
	padding: .55rem 2.25rem .55rem .85rem;
	font-size: 1rem;
	font-family: inherit;
	color: var(--text-dark);
	line-height: 1.1;
	cursor: pointer;
	box-shadow: var(--shadow-sm);
	transition: border-color .25s, box-shadow .25s, transform .25s;
	position: relative;
}
select:focus { outline: none; box-shadow: var(--focus-ring); }
select:hover { border-color: var(--accent-soft); }
select:active { transform: scale(.98); }

/* Fake chevron */
select {
	background-image: linear-gradient(45deg, var(--accent) 50%, transparent 51%),
		linear-gradient(-45deg, var(--accent) 50%, transparent 51%);

	background-position: right 14px top 50%, right 8px top 50%;
	background-size: 8px 8px, 8px 8px;
	background-repeat: no-repeat;
}

#storeStatus {
	margin: .65rem 0 1.25rem;
	font-style: italic;
	font-size: .95rem;
	color: var(--accent);
	padding: .4rem .75rem;
	background: linear-gradient(90deg, rgba(var(--accent-rgb) / .08), rgba(var(--accent-rgb) / 0));
	border-radius: var(--radius-sm);
}

/* Pack list */
ul#packList {
	list-style: none;
	padding: 0;
	margin: 0;
	display: grid;
	gap: .6rem;
	grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
}

/* Individual items */
ul#packList li,
ul#packList li[data-type=pack] {
	cursor: pointer;
	background: #fff;
	border: 2px solid #ffe3f1;
	padding: .75rem .85rem .7rem;
	border-radius: var(--radius-sm);
	font-weight: 600;
	font-size: .95rem;
	letter-spacing: .25px;
	display: flex;
	flex-direction: column;
	gap: .3rem;
	position: relative;
	min-height: 3.4rem;
	transition: background .35s, transform .25s, box-shadow .25s, border-color .35s;
}
ul#packList li:before {
	content: "";
	position: absolute;
	inset: 0;
	background: linear-gradient(135deg, rgba(var(--accent-rgb) / .08), rgba(var(--accent-rgb) / 0));
	opacity: .6;
	border-radius: inherit;
	pointer-events: none;
	transition: opacity .35s;
}
ul#packList li:hover {
	transform: translateY(-3px);
	background: linear-gradient(180deg, #fff, #ffeef8);
	border-color: var(--accent-soft);
	box-shadow: 0 6px 18px -4px rgba(var(--accent-rgb) / .35);
}
ul#packList li:active {
	transform: translateY(0) scale(.98);
	box-shadow: var(--shadow-sm);
}
ul#packList li:hover:before { opacity: 1; }

/* Quantity pill */
.qty {
	margin-left: 0;
	font-size: .75rem;
	font-weight: 500;
	opacity: .85;
	letter-spacing: .5px;
	background: rgba(var(--accent-rgb) / .14);
	padding: .2rem .55rem .25rem;
	border-radius: 999px;
	align-self: flex-start;
	color: var(--text-dark);
	box-shadow: inset 0 0 0 1px rgba(var(--accent-rgb) / .25);
}

/* Responsive tweak */
@media (max-width: 540px) {
	#container { padding: 1.1rem 1rem 1.4rem; }
	ul#packList { grid-template-columns: 1fr 1fr; }
	ul#packList li { font-size: .9rem; }
	h1 { font-size: 2.1rem; }
}

@media (max-width: 400px) {
	ul#packList { grid-template-columns: 1fr; }
	label { display: block; margin-bottom: .35rem; }
}

/* Accessibility: keyboard focus outlines for clickable list items */
ul#packList li:focus-visible {
	outline: none;
	box-shadow: var(--focus-ring);
}

/* Motion preference */
@media (prefers-reduced-motion: reduce) {
	* { transition: none !important; animation: none !important; }
}
EOF

echo "[build] Writing scripts/database.js"
cat > "$SCRIPT_DIR/database.js" <<'EOF'
// scripts/database.js

// ------------------------------
// Packs (products to buy)
// ------------------------------
const packs = [
  { id: 1, name: "Bot Types",   theme: "bot"   },
  { id: 2, name: "Plant Types",  theme: "plant" },
  { id: 3, name: "Meat Types",    theme: "meat"  },
  { id: 4, name: "Rock Types",   theme: "rock"  },
];

// ------------------------------
// Cards (each belongs to exactly ONE pack via packId)
// ------------------------------
const cards = [
  // --- MEAT (packId: 3) ---
  { id: 1,  name: "Dexter",   type: "meat",  attack: 20, info: "Dexters are good monsters who never do anything wrong. They likes pets and going to the monsters park.", packId: 3 },
  { id: 2,  name: "Human",    type: "meat",  attack: 6,  info: "Humans are well known for being the grossest monsters. They don't smell good and their bodies are disturbingly squishy.", packId: 3 },
  { id: 12, name: "Sloth",    type: "meat",  attack: 4,  info: "Sloths move at their own pace, which is very, very slow. They might attack you next week.", packId: 3 },
  { id: 13, name: "Deer",     type: "meat",  attack: 8,  info: "Deer are weirdos that eat stuff everyone else has already stepped on.", packId: 3 },
  { id: 14, name: "Giraffe",  type: "meat",  attack: 10, info: "Giraffes have their heads in the clouds, literally. They can spot opponents from miles away.", packId: 3 },

  // --- BOT (packId: 1) ---
  { id: 3,  name: "Boyarbot",  type: "bot",  attack: 6,  info: "Boyarbot is a cookbot not a fightbot. Soup is their particular specialty.", packId: 1 },
  { id: 4,  name: "Yarbot",    type: "bot",  attack: 10, info: "Yarbots were engineered for the open seas. They can shiver timbers with 87% accuracy.", packId: 1 },
  { id: 9,  name: "Knightbot", type: "bot",  attack: 12, info: "Knightbots uphold the code of chivalry. They are armored and ready to joust at any moment.", packId: 1 },
  { id: 10, name: "Scribebot", type: "bot",  attack: 6,  info: "Scribebots document every battle in exquisite detail. Their quills can be surprisingly sharp.", packId: 1 },
  { id: 11, name: "Dancebot",  type: "bot",  attack: 8,  info: "Dancebots groove to their own beat. They can mesmerize opponents with their slick moves.", packId: 1 },

  // --- PLANT (packId: 2) ---
  { id: 5,  name: "Carrotot",   type: "plant", attack: 6,  info: "Carrotot are cute as three buttons, but don't let that fool you: they can be mean.", packId: 2 },
  { id: 6,  name: "Potatot",    type: "plant", attack: 4,  info: "I'll be honest with you: potatot should not be competing in monster battles. They are fragile and have no arms.", packId: 2 },
  { id: 15, name: "Onioni",     type: "plant", attack: 10, info: "Onioni have many layers, and can bring their opponents to tears.", packId: 2 },
  { id: 16, name: "Cabbaggage", type: "plant", attack: 6,  info: "Cabbaggage may seem leafy and harmless, but they pack a surprising punch.", packId: 2 },
  { id: 17, name: "Tomatot",    type: "plant", attack: 4,  info: "Tomatot are fresh and zesty. Be careful when they start to roll.", packId: 2 },

  // --- ROCK (packId: 4) ---
  { id: 7,  name: "Suitament",  type: "rock",  attack: 8,  info: "Suitament are business rocks of rare renown. You aren't likely to find a more professional monsters out there.", packId: 4 },
  { id: 8,  name: "Scigneous",  type: "rock",  attack: 6,  info: "Scigneous are geniuses. Honestly, they should be your monster trainer.", packId: 4 },
  { id: 18, name: "Spyrate",    type: "rock",  attack: 12, info: "Spyrate blend the stealth of spies with the luster of pyrite. They infiltrate battles undetected.", packId: 4 },
  { id: 19, name: "Bossalt",    type: "rock",  attack: 8,  info: "Bossalt are natural leaders with a composition as tough as basalt. They command respect.", packId: 4 },
  { id: 20, name: "Edgelord",   type: "rock",  attack: 6,  info: "These guys are really high on their own drama.", packId: 4 },
];



// ------------------------------
// Getters (return safe copies so originals aren't mutated)
// ------------------------------
export const getPacks      = () => packs.map(p => ({ ...p }));
export const getCards      = () => cards.map(c => ({ ...c }));
EOF

echo "[build] Writing scripts/main.js"
cat > "$SCRIPT_DIR/main.js" <<'EOF'
import { getStores, getStorePacks, getPacks, getCards } from "./database.js";
let selectedStoreId = null;

const mainContainer = document.querySelector("#container");


function renderPackList() {
  const packs = getPacks();

  if (selectedStoreId === null) {
    const listItems = packs.map(p => `<li data-id="${p.id}" data-type="pack">${p.name}</li>`);
    return `<ul id="packList">${listItems.join("")}</ul>`;
  }

  const selectedStoreInventory = getStorePacks().filter(sp => sp.storeId === selectedStoreId);
  if (selectedStoreInventory.length === 0) {
    return `<p id="packList">(No packs available at this store.)</p>`;
  }

  const listItems = selectedStoreInventory.map(sp => {
    const pack = packs.find(p => p.id === sp.packId);
    if (!pack) return `<li>(Unknown pack #${sp.packId}) — Qty: ${sp.quantity}</li>`;
    return `<li data-id="${pack.id}" data-type="pack">${pack.name} — Qty: ${sp.quantity}</li>`;
  });

  return `<ul id="packList">${listItems.join("")}</ul>`;
}


function storeSelect() {
  const stores = getStores();
  const options = stores
    .map(s => `<option value="${s.id}">${s.name}</option>`)
    .join("");

  return `
    <label for="storeSelect">Store:</label>
    <select id="storeSelect">
	 <option value="">-- Select a store --</option>
	 ${options}
    </select>
  <p id="storeStatus">Select a Store</p>
  `;
}

document.addEventListener("click", (event) => {
  const itemClicked = event.target;

  if (itemClicked.dataset.type === "pack") {
    const packId = parseInt(itemClicked.dataset.id);

    const allCards = getCards();

    const cardsInPack = allCards.filter(card => card.packId === packId);

    const cardNames = cardsInPack.map(card => card.name).join(", ");
    alert(`This pack contains: ${cardNames}`);
  }
});



mainContainer.innerHTML = storeSelect() + renderPackList();

const selectEl = document.querySelector("#storeSelect");
const statusEl = document.querySelector("#storeStatus");

selectEl.addEventListener("change", (event) => {
  const value = event.target.value; // "" or "3"

  if (value === "") {
    selectedStoreId = null;
    statusEl.textContent = "Select a Store";
    document.querySelector("#packList").outerHTML = renderPackList();
    return;
  }

  const selectedId = parseInt(value);
  const store = getStores().find(s => s.id === selectedId);

  if (store) {
    statusEl.textContent = "Showing packs for: " + store.name;
    selectedStoreId = selectedId;
  } else {
    statusEl.textContent = "Showing packs for: (unknown)";
    selectedStoreId = null;
  }

  document.querySelector("#packList").outerHTML = renderPackList();
});
EOF

echo "[build] Writing BUILD_INFO.txt"
cat > "$BUILD_DIR/BUILD_INFO.txt" <<'EOF'
Sakura's Card Shops Build

EOF

echo "[build] Files generated:"
find "$BUILD_DIR" -type f | while read -r f; do echo "  - $f"; done

echo "[build] Complete."
