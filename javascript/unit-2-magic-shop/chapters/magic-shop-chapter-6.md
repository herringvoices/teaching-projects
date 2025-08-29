# Chapter 6: Modular Magic — Extracting Functions

Your Magical Shop is getting tidier now that the data lives in its own file, but the utility functions—those little spells that decide what’s a bargain, what’s apparel, or what’s a wand—are still cluttering up your `main.js`. Time to give those functions their own home.

---

## What You’ll Do

1. **Create a new file called `functions.js`.**

2. **Cut all the utility functions from `main.js`** and paste them into `functions.js`. Move these functions:
   - `allCaps` (from Chapter 2)
   - `calculateAveragePrice` (from Chapter 3)
   - `isBargain` (helper function for filtering)
   - `isApparel` (helper function for filtering)
   - `isWand` (helper function for filtering)

3. **Export each function from `functions.js`** by adding `export` before each function declaration, like this:

```js
export const allCaps = (product) => {
    // Your code here
};

export const calculateAveragePrice = (products) => {
    // Your code here
};

export const isBargain = (magicItem) => {
    // Your code here
};

export const isApparel = (item) => {
    // Your code here
};

export const isWand = (product) => {
    // Your code here
};
```

4. **Import multiple functions into your `main.js`** using a single import statement with curly braces, listing all the functions you need:

```js
import { allCaps, calculateAveragePrice, isBargain, isApparel, isWand } from './functions.js';
```

5. **Important: Keep the `renderList` function in `main.js`!**

The `renderList` function (or any function that directly manipulates the DOM) should stay in your main file because:
- It's specific to your HTML page structure
- It handles the "presentation layer" of your app
- It connects your data and utility functions to the actual webpage

Only move **utility functions** that work with data but don't touch the DOM.

6. **Verify your app still works as expected** (apart from the intentional bugs).

---

## Why Import Multiple Functions Like This?

JavaScript modules allow you to export many different values (functions, variables, classes) from one file. When importing, you list exactly what you want to bring in within curly braces.

This keeps your imports clean and explicit, making your code easier to read and debug.

---

## Common Pitfall

Make sure the function names inside the import statement **exactly match** the exported names in `functions.js`. JavaScript is case-sensitive!

Also make sure you include the `.js` in your file path!

---

## When you’re ready, move on to…

[← Previous Chapter](./magic-shop-chapter-4.md) | [Next Chapter →](./magic-shop-chapter-6.md)
[← Previous Chapter](./magic-shop-chapter-5.md) | [Next Chapter →](./magic-shop-chapter-7.md)

---