#!/bin/bash
set -u

mkdir -p magical-shop
cd magical-shop

# index.html
cat <<'EOF' > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>The Magic Shop</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>The Magic Shop</h1>
    <div class="container">
        <section>
            <h2>Bargains</h2>
            <ul id="bargains-list"></ul>
        </section>
        <section>
            <h2>Wands</h2>
            <ul id="wands-list"></ul>
        </section>
        <section>
            <h2>Ingredients</h2>
            <ul id="ingredients-list"></ul>
        </section>
        <section>
            <h2>Apparel</h2>
            <ul id="apparel-list"></ul>
        </section>
    </div>
    <script src="main.js"></script>
</body>
</html>
EOF

# style.css
cat <<'EOF' > style.css
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(120deg, #faf0e6, #e0c3fc 80%);
    color: #232323;
    margin: 0;
    padding: 0;
}
h1 {
    text-align: center;
    margin-top: 2rem;
    font-size: 2.5rem;
    letter-spacing: 2px;
}
.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 2rem;
    margin: 2rem auto;
    max-width: 1100px;
}
section {
    background: rgba(255,255,255,0.94);
    border-radius: 16px;
    box-shadow: 0 2px 18px 2px #b37bce33;
    padding: 1.5rem 2rem;
    min-width: 220px;
    flex: 1 1 220px;
}
h2 {
    font-size: 1.25rem;
    margin-bottom: 1rem;
    color: #8a3ab9;
}
ul {
    list-style: disc inside;
    margin: 0;
    padding: 0;
}
li {
    padding: 0.4em 0;
    font-size: 1.05rem;
    letter-spacing: 0.5px;
}
EOF

# main.js
cat <<'EOF' > main.js
const inventory = [
    { id: 1, description: "Mandrake Root (Locally Screamed)", price: 11.00, type: "ingredient" },
    { id: 2, description: "Cloak of Unreadable Thoughts", price: 79.99, type: "apparel" },
    { id: 3, description: "Wand of Unending Sneeze", price: 349.99, type: "wand" },
    { id: 4, description: "Boots of Subtle Squeaking", price: 39.99, type: "apparel" },
    { id: 5, description: "Essence of Shadow (Bottled at Twilight)", price: 32.00, type: "ingredient" },
    { id: 6, description: "Gloves of Butterfingers", price: 24.99, type: "apparel" },
    { id: 7, description: "Wand of Summon Bumblebee", price: 499.99, type: "wand" },
    { id: 8, description: "Phoenix Feather (Ethically Molted)", price: 99.00, type: "ingredient" },
    { id: 9, description: "Spectacles of Slightly Better Vision", price: 19.99, type: "apparel" },
    { id: 10, description: "Dragon Toenail Shavings", price: 7.50, type: "ingredient" },
    { id: 11, description: "Hat of Questionable Taste", price: 14.99, type: "apparel" },
    { id: 12, description: "Wand of Mildly Inconvenient Weather", price: 229.99, type: "wand" }
];

const isBargain = (magicItem) => {
    if (item.price < 50.00) {
        return true;
    }
    return false;
};

const isApparel = (item) => {
    if (item.clothing.type === "apparel") {
        return true;
    }
    return false;
};

const isWand = (product) => {
    if (product.item.price === "wand") {
        return true;
    }
    return false;
};

function renderList(items, listId) {
    const ul = document.getElementById(listId);
    ul.innerHTML = "";
    for (const product of items) {
        const li = document.createElement("li");
        li.textContent = product.description + " — $" + product.price;
        ul.appendChild(li);
    }
}

const bargains = [];
for (const item of inventory) {
    if (isBargain(item)) {
        bargains.push(item);
    }
}
renderList(bargains, "bargains-list");

const wands = [];
for (const item of inventory) {
    if (isWand(item)) {
        wands.push(item);
    }
}
renderList(wands, "wands-list");

const ingredients = [];
for (const item of inventory) {
    if (item.type === "ingredient") {
        ingredients.push(item);
    }
}
renderList(ingredients, "ingredients-list");

const apparel = [];
for (const item of inventory) {
    if (isApparel(item)) {
        apparel.push(item);
    }
}
renderList(apparel, "apparel-list");
EOF

echo "Magical shop project created! Open index.html in Live Server to start debugging."