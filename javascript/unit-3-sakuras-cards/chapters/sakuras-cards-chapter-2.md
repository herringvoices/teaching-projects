
# Chapter 2: Showing the Packs

Sakura’s customers are practically pounding on the counter, demanding, *“What packs do you sell?! Show us the goods!”* But when they pull up the site… it’s a barren wasteland—no packs, no clues, just empty space. Total disaster. Your mission: **manifest a glorious list of every pack of cards Sakura sells** so visitors finally know what treasures await them.

---

## Learning Objectives

By the end of this chapter, you should be able to:

* **Import** `getPacks()` from `database.js` (the database already provides `getPacks()` and `getCards()` for you).
* Use the **`.map()`** function to transform an array into a new array of values.
* Generate HTML list items (`<li>`) from the `packs` data.
* Insert that HTML into the page so the packs are visible in the browser.

---

## Technical Vocabulary

| Term                | Definition                                                                                               |
| ------------------- | -------------------------------------------------------------------------------------------------------- |
| `import` / `export` | ES module keywords used to share functions between files. You’ll import `getPacks()` from `database.js`. |
| `.map()`            | A JavaScript method that creates a new array by running a function on every item in the original array.  |
| Return Value        | The result that comes back from a function. `.map()` collects all the return values into a new array.    |
| innerHTML           | A property that sets or gets the HTML inside an element.                                                 |

---

## Step 0: Check Your Script Tag

Before you even write more JavaScript, make sure your `index.html` has the right script tag so that imports work correctly. It should look like this:

```html
<script type="module" src="./main.js"></script>
```

The `type="module"` part is what allows you to use `import` and `export` in your code.

---

## Step 1: Select the Container

Open `main.js` and make sure you have a reference to the container in your HTML where the packs should go. For example:

```js
const mainContainer = document.querySelector("#container");
```

This will let you insert your list into the page later.

---

## Step 2: Import `getPacks()` from `database.js`

The database module already provides `getPacks()` (and `getCards()` for later chapters). **You do not need to write these functions.** Just import `getPacks()` at the top of your `main.js` file (all your UI helpers will live here—no extra modules needed right now).

```js
// main.js (top of file)
import { getPacks } from "./database.js";
```

That’s it—now you can call `getPacks()` to retrieve the packs.

---

## Step 3: Build a List Helper (in `main.js`)

Instead of using a `for...of` loop like before, we’re going to use `.map()`. It’s perfect for turning each pack object into an HTML string. Finally, wrawp your `.join`ed `listItem`s in a `<ul>` with an id of "packList". We'll use that id in Chapter 6.

```js
// Still in main.js
function renderPackList() {
  const packs = getPacks();

  const listItems = packs.map(pack => `<li>${pack.name}</li>`);

  const html = `<ul id="packList">${listItems.join("")}</ul>`;
  return html;
}
```

### What’s happening here?

* `packs.map(pack => { ... })` goes through each pack in the array.
* For each one, it returns an `<li>` string with the pack’s name.
* `.map()` collects all those `<li>` strings into a new array called `listItems`.
* `listItems.join("")` smashes the array into one big string.
* Finally, we wrap everything in `<ul id="packList">…</ul>`.

---

## Step 4: Put the List on the Page

In `main.js`, call your `renderPackList()` function and put the result into the container:

```js
mainContainer.innerHTML = renderPackList();
```

Now refresh your browser. You should see a list of every pack in the database!

---

## Reflection

* Notice how `.map()` transformed data into HTML in one clean step.
* Think about the ERD you drew: you’re now rendering one of those entities (Packs) directly on the page.
* Later, you’ll connect packs to their related cards—but first, celebrate this win: the packs are live!

---

## Navigation

[← Previous Chapter](./sakuras-cards-chapter-1.md) | [Next Chapter →](./sakuras-cards-chapter-3.md)
