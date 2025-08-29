# Chapter 5: Add a Store Dropdown

Sakura needs to track what’s happening at each **store** she owns. In this chapter you’ll add a simple dropdown so Sakura (or you, as the admin) can pick a store. For now, picking a store will just **log** information and update a small status message. *(Filtering comes next chapter.)*

---

## Learning Objectives

By the end of this chapter, you should be able to:

* Render a **Store** dropdown using `getStores()` and `.map()`.
* Attach a **`change`** event listener to a `<select>` element.
* Read the selected **store id** from `event.target.value` and **turn it into a number** with `parseInt(value)`.
* Show feedback by updating a **status line** and logging to the Console.

---

## Technical Vocabulary

| Term              | Definition                                                  |
| ----------------- | ----------------------------------------------------------- |
| `<select>`        | A dropdown form element.                                    |
| `<option>`        | One choice inside a dropdown.                               |
| `value`           | The data attached to the selected `<option>`.               |
| `change`          | An event that fires when the user picks a different option. |
| `parseInt(value)` | Turns the dropdown’s string (e.g., "3") into the number 3.  |

---

## Step 1: Build the Store Dropdown *(in `main.js`)*

Create a small function that returns the dropdown HTML. It will:

* Load stores with `getStores()`
* Build `<option>` tags with `.map()`
* Include a status line we’ll update later

```js
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
```

---

## Step 2: Render the Dropdown **and** the Pack List *(in `main.js`)*

Keep your pack list from Chapter 2 (now named `renderPackList()`). Put the dropdown **above** the list.

```js
const container = document.querySelector("#container");
container.innerHTML = storeSelect() + renderPackList();
```

---

## Step 3: Listen for `change` on the Dropdown *(in `main.js`)*

Goal: React whenever the user picks (or clears) a store. For now we only log info and update a status line. (Filtering packs happens in Chapter 6.)

IMPORTANT Placement: Make sure you render the dropdown BEFORE you try to grab it with `document.querySelector`. That means the line where you set the container's innerHTML (e.g. `container.innerHTML = storeSelect() + renderPackList();` or `mainContainer.innerHTML = storeSelect() + renderPackList();`) must appear ABOVE all the Sub-Step 1 code below. If you put the listener code at the very top of the file (before rendering), `querySelector("#storeSelect")` will return `null` and your code will break.

Tip: If your file currently renders later, move that render line up so the flow is:
1. Imports
2. Function definitions (`renderPackList`, `storeSelect`, etc.)
3. Render line: `container.innerHTML = storeSelect() + renderPackList();`
4. THEN the Sub-Step 1 code below.

Build it in sub-steps. Try each one first, then reveal to check. Notes marked Placeholder explain code that will be extended later.

### Sub-Step 1: Grab the elements you'll use
Instruction: Initialize a variable called `selectEl`, and set it equal to the `<select>` element with an id of`storeSelect`.
Do the same with the element with an id of `storeStatus`.
>**Note:** Add these at the top of your `main.js` files where you have already initialized your `mainContainer` variable.
<details>
  <summary>Reveal Sub-Step 1 code</summary>

```js
const selectEl = document.querySelector("#storeSelect");
const statusEl = document.querySelector("#storeStatus");
```
</details>

### Sub-Step 2: Add the `change` listener
Instruction: Add a `change` event listener to `selectEl`.
<details>
  <summary>Reveal Sub-Step 2 code</summary>

```js
selectEl.addEventListener("change", (event) => {
  // more steps go inside
});
```
</details>

### Sub-Step 3: Read the raw value
Instruction: Inside the listener, store `event.target.value` in a variable named `value`. (It will be a string like `""` or `"3"`.)
<details>
  <summary>Reveal Sub-Step 3 code</summary>

```js
  const value = event.target.value; // "" or "3"
```
</details>

### Sub-Step 4: Handle the empty choice
Instruction: If `value === ""`, log that no store is selected, set the status text to the default, then `return` early.
Placeholder: This early return will stay, but later (Chapter 6) we may also reset filtered packs here.
<details>
  <summary>Reveal Sub-Step 4 code</summary>

```js
  if (value === "") {
    console.log("No store selected"); // Placeholder: just logging for now
    statusEl.textContent = "Select a Store"; // Placeholder: later might also reset UI
    return;
  }
```
</details>

### Sub-Step 5: Convert the value to a number
Instruction: Use `parseInt(value)` and store it in `selectedId`.
<details>
  <summary>Reveal Sub-Step 5 code</summary>

```js
  const selectedId = parseInt(value); // convert string -> number
```
</details>

### Sub-Step 6: Find the matching store object
Instruction: Use `getStores().find(...)` to locate the store with that id. Store it in `store`.
Placeholder: For now we only read its name; later we might drive filtering logic with this object.
<details>
  <summary>Reveal Sub-Step 6 code</summary>

```js
  const store = getStores().find(s => s.id === selectedId);
```
</details>

### Sub-Step 7: Log what happened
Instruction: If `store` exists, log its id + name; otherwise log that it wasn't found.
Placeholder: This log helps us verify wiring before adding filtering behavior in Chapter 6.
<details>
  <summary>Reveal Sub-Step 7 code</summary>

```js
  if (store) {
    console.log("Selected store id:", selectedId, "name:", store.name); // Placeholder
  } else {
    console.log("Selected store id:", selectedId, "but store not found"); // Placeholder
  }
```
</details>

### Sub-Step 8: Update the status line
Instruction: Set `statusEl.textContent` to show which store is active (or unknown).
Placeholder: Later this text will reflect filtered pack results.
<details>
  <summary>Reveal Sub-Step 8 code</summary>

```js
  if (store) {
    statusEl.textContent = "Showing packs for: " + store.name; // Placeholder summary
  } else {
    statusEl.textContent = "Showing packs for: (unknown)"; // Placeholder error state
  }
```
</details>

### Full Solution
Open only after assembling the pieces yourself.

<details>
  <summary>Reveal full change listener code</summary>

```js
// main.js
const selectEl = document.querySelector("#storeSelect");
const statusEl = document.querySelector("#storeStatus");

selectEl.addEventListener("change", (event) => {
  const value = event.target.value; // "" or "3"
  if (value === "") {
    console.log("No store selected"); // Placeholder
    statusEl.textContent = "Select a Store"; // Placeholder
    return;
  }

  const selectedId = parseInt(value); // number now
  const store = getStores().find(s => s.id === selectedId); // Placeholder use

  if (store) {
    console.log("Selected store id:", selectedId, "name:", store.name); // Placeholder
    statusEl.textContent = "Showing packs for: " + store.name; // Placeholder
  } else {
    console.log("Selected store id:", selectedId, "but store not found"); // Placeholder
    statusEl.textContent = "Showing packs for: (unknown)"; // Placeholder
  }
});
```
</details>

### Quick Recap
1. Grab elements.
2. Attach one `change` listener.
3. Read the raw string value.
4. Early-return on empty (placeholder for future reset logic).
5. Convert to number.
6. Find matching store.
7. Log selection (placeholder for future behavior).
8. Update status (placeholder UI feedback).

---

## Step 4: See Your Logs (Windows)

Open the **Console** to verify your code.

1. Right‑click the page → **Inspect** → **Console**
2. Or press **Ctrl+Shift+J** (or **F12** and open the Console tab)

Pick a store from the dropdown. You should see a log like:

```
Selected store id: 2 name: Midtown
```

---

## Reflection

* You reused the same pattern from Chapter 2 (**`.map()` → HTML**), but this time for `<option>`s.
* You learned to read `event.target.value` and **turn it into a number** before comparing ids.
* The UI hasn’t changed what packs are shown yet. That filtering happens next.

---

## Consistency Check

* The **pack list renders** on page load (from Chapter 2).
* Clicking a pack still **alerts its cards** (from Chapter 3).
* The **Store dropdown** appears with a placeholder and store names.
* Changing the selection **updates the status line** and **logs id + name** to the Console.

---

## Cleanup Callout

* **Keep** the Console logs for now; they’ll help in the next chapter.
* Don’t change your pack rendering yet. Filtering by store comes in Chapter 6.

---

## Navigation

[← Previous Chapter](./sakuras-cards-chapter-4.md) | [Next Chapter →](./sakuras-cards-chapter-6.md)
