#!/usr/bin/env bash
# newdata.sh
# Replace scripts/database.js with the contents of the original second.js
# Only proceeds if the current working directory's basename is exactly 'sakuras-cards'.
# Usage: (from project root) cd sakuras-cards && ../newdata.sh
# Or copy this script into sakuras-cards and run ./newdata.sh

set -euo pipefail

TARGET_DIR_NAME="sakuras-cards"
CURRENT_DIR_NAME="$(basename "$PWD")"

if [ "$CURRENT_DIR_NAME" != "$TARGET_DIR_NAME" ]; then
  echo "[newdata] Error: Run this script from inside the '$TARGET_DIR_NAME' directory (current: '$CURRENT_DIR_NAME')." >&2
  exit 1
fi

SCRIPT_PATH="scripts/database.js"
BACKUP_PATH="scripts/database.js.bak"

if [ -f "$SCRIPT_PATH" ]; then
  cp "$SCRIPT_PATH" "$BACKUP_PATH"
  echo "[newdata] Backup created at $BACKUP_PATH"
else
  echo "[newdata] Note: $SCRIPT_PATH did not exist; it will be created."
fi

echo "[newdata] Writing new contents to $SCRIPT_PATH (sourced from original second.js)"
cat > "$SCRIPT_PATH" <<'EOF'
/// scripts/database.js


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
// Stores (locations)
// ------------------------------
const stores = [
  { id: 1, name: "SC Downtown" },
  { id: 2, name: "SC Midtown" },
  { id: 3, name: "SC Harborfront" },
];

// ------------------------------
// Join table: which stores carry which packs (and how many)
// ------------------------------
const storePacks = [
  // Downtown carries Bots + Meat
  { id: 1, storeId: 1, packId: 1, quantity: 8 },
  { id: 2, storeId: 1, packId: 3, quantity: 6 },

  // Midtown carries Plants + Rock
  { id: 3, storeId: 2, packId: 2, quantity: 5 },
  { id: 4, storeId: 2, packId: 4, quantity: 7 },

  // Harborfront carries Bots + Plants + Rock
  { id: 5, storeId: 3, packId: 1, quantity: 4 },
  { id: 6, storeId: 3, packId: 2, quantity: 6 },
  { id: 7, storeId: 3, packId: 4, quantity: 9 },
];

// ------------------------------
// Getters (return safe copies so originals aren't mutated)
// ------------------------------
export const getPacks      = () => packs.map(p => ({ ...p }));
export const getCards      = () => cards.map(c => ({ ...c }));
export const getStores     = () => stores.map(s => ({ ...s }));
export const getStorePacks = () => storePacks.map(sp => ({ ...sp }));
EOF

echo "[newdata] Replacement complete."
