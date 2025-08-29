# Chapter 6: Filter Packs by Store (and Show Quantities)

Sakura’s site is almost there. In this final chapter you’ll connect the **Store** dropdown to the **Pack List**, so users can:

* Select a **store** from the dropdown
* See **which packs** that store carries **and how many** (quantity)
* Click a **pack** to reveal the cards inside (your Chapter 3 listener keeps working)

---

## Learning Objectives

By the end of this chapter, you should be able to:

* Track simple UI state with a variable and re-render from that state
* Filter a **join table** (`storePacks`) by `storeId`, then join to `packs` to render the filtered list with **quantities**
* Keep your existing **pack click** behavior working across re-renders
* Use `outerHTML` to replace one DOM element (vs rebuilding the whole page)

---

## Technical Vocabulary

| Term | Definition |
| ---- | ---------- |
| State | A variable that remembers what the UI should show right now (here: `selectedStoreId`). |
| Re-render | Rebuild some HTML based on current state. |
| Join table | A table linking two others plus extra data (`storePacks` links stores ↔ packs + `quantity`). |
| `outerHTML` | A property (string) representing the element’s full HTML including the element tag itself. Assigning to it replaces the entire element node in the DOM. |
| `innerHTML` | Only the contents *inside* the element’s tags. Replacing it keeps the same node. |
| Inventory | The list of `storePacks` rows for a specific store. |

### A quick word on `outerHTML` vs `innerHTML`
We will use `outerHTML` to swap the whole `<ul id="packList">` for a fresh one. If we used `innerHTML`, we’d have to keep the same `<ul>` and only change its children. Either works here—but `outerHTML` lets `renderPackList()` stay responsible for returning a complete `<ul>` element every time.

---

## Big Picture Flow
1. Add a tiny piece of **state** (`selectedStoreId`).
2. Enhance `renderPackList()` so it uses that state.
3. Give the list an id so we can surgically replace it.
4. Upgrade the existing dropdown listener to: update state → re-render list → update status line.

We’ll do this in **larger sub-steps** than Chapter 5 (you’ve got the patterns now). Each sub-step has an Instruction and a Reveal block. Try first, then peek.

---

## Step 1: Add UI State & Prepare the Renderer (in `main.js`)

We need a variable to remember which store is active and update `renderPackList()` so it can branch.

### Sub-Step 1: Add the state variable
Instruction: At the very top (after imports), declare `let selectedStoreId = null;`. We'll update this variable later based on what the user chooses in our dropdown menu.

```js
let selectedStoreId = null; // null means “no store selected yet”
```

### Sub-Step 2: Locate your `renderPackList()` function
Instruction: Find the function you created in earlier chapters that returns the `<ul>` of packs.
<details><summary>Reveal Sub-Step 2 reminder</summary>

```js
//This is the function we're looking for:
function renderPackList() {
  //You already have some code in here
}
```
</details>

### Sub-Step 3: Add the "no store selected" branch
Instruction: If `selectedStoreId` is `null`, we want to show all the packs. Since you have three lines of code that already do that, **just wrap those three lines** in an `if (selectedStoreId === null) { ... }` block—don’t change the lines themselves; only add the if statement and wrap them in curly braces.
<details><summary>Reveal Sub-Step 3 code</summary>

```js
if (selectedStoreId === null) {
  const listItems = packs.map(p => `<li data-id="${p.id}" data-type="pack">${p.name}</li>`);
  return `<ul id="packList">${listItems.join("")}</ul>`;
}
```
</details>

### Sub-Step 4: Build the filtered + quantity branch
Instruction:
1) Get this store’s rows from `getStorePacks()`.
2) If none, return a message.
3) Map each row to its pack & output name plus quantity. Ensure the `<ul>` also has `id="packList"`.
<details><summary>Reveal Sub-Step 4 code</summary>

```js
const selectedStoreInventory = getStorePacks().filter(sp => sp.storeId === selectedStoreId);

if (selectedStoreInventory.length === 0) {
  return `<p id="packList">(No packs available at this store.)</p>`;  //The packList id makes it so we can replace it easily later, just like our <ul>
}

const listItems = selectedStoreInventory.map(sp => {
  const pack = packs.find(p => p.id === sp.packId);
  if (!pack) return `<li>(Unknown pack #${sp.packId}) — Qty: ${sp.quantity}</li>`;
  return `<li data-id="${pack.id}" data-type="pack">${pack.name} — Qty: ${sp.quantity}</li>`;
});

return `<ul id="packList">${listItems.join("")}</ul>`;
```
</details>

### Sub-Step 5: Full upgraded `renderPackList()` (for reference)
Instruction: Compare with your version—only use this if stuck or to check your work.
<details><summary>Reveal Sub-Step 5 full function</summary>

```js
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
```
</details>

---

## Step 2: Enhance the Existing `change` Listener
We keep the listener you already wrote. We only add: update state + re-render list (via `outerHTML`).

### Sub-Step 1: Update state when cleared
Instruction: If `value === ""`, set `selectedStoreId = null`, reset status text, then replace `#packList` with a fresh unfiltered list.
<details><summary>Reveal Sub-Step 1 patch</summary>

```js
if (value === "") {
  selectedStoreId = null;
  statusEl.textContent = "Select a Store";
  document.querySelector("#packList").outerHTML = renderPackList();
  return;
}
```
</details>

### Sub-Step 2: Store selected id & find matching store
Instruction:
1) Convert the dropdown’s value to a number and save it as a new variable called `selectedId`.
2) Look up the matching store with `getStores().find(...)`.
3) If a store is found, update the status line to show its name and set `selectedStoreId = selectedId`.
4) If not found (edge case), show an “(unknown)” message and set `selectedStoreId = null` so the app doesn’t think a valid store is active.
<details><summary>Reveal Sub-Step 2 patch</summary>

```js
const selectedId = parseInt(value);
const store = getStores().find(s => s.id === selectedId);

if (store) {
  statusEl.textContent = "Showing packs for: " + store.name;
  selectedStoreId = selectedId;
} else {
  statusEl.textContent = "Showing packs for: (unknown)";
  selectedStoreId = null;
}
```
</details>

### Sub-Step 3: Re-render only the list
Instruction: After updating state, replace the current list node using `outerHTML`.
<details><summary>Reveal Sub-Step 3 code</summary>

```js
document.querySelector("#packList").outerHTML = renderPackList();
```
</details>

### Sub-Step 4: Full listener reference
Instruction: Use if you're stuck or to check your work.
<details><summary>Reveal Sub-Step 4 full listener</summary>

```js
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
```
</details>

### Why `outerHTML` here?
* It swaps the entire list element in one shot.
* Your dropdown & its listener remain untouched (we’re not re-rendering them).
* The new `<ul>` comes back with the right contents for current state.
* Your document-level click listener from Chapter 3 still works because it lives higher up and catches clicks on the freshly inserted `<ul>`.

---

## Step 4: Test the Flow
1. Page load: All packs (no qty) + status “Select a Store.”
2. Pick a store: List shrinks to only that store + each item shows “— Qty: N”.
3. Click a pack: Cards still show (unchanged listener).
4. Clear store (placeholder option): Back to full catalog (no quantities).

---

## Troubleshooting
* Quantities missing: Are you using `getStorePacks()` when a store is selected?
* Clicks stopped working: Did list items keep `data-id` & `data-type="pack"`? Is your document-level click listener still present?
* Clearing doesn’t reset: Did you set `selectedStoreId = null` inside the empty-value branch and then re-render?
* Nothing updates: Confirm the `<ul>` (or fallback `<p>`) has `id="packList"`.

---

## Quick Recap
1. Track state (`selectedStoreId`).
2. Conditional render: catalog vs filtered inventory with quantities.
3. Give the list a stable id for surgical replacement.
4. Listener: update state → swap list via `outerHTML` → status feedback.

---

## Final Reference (Optional Copy/Paste)
Only use if stuck—prefer building it step-by-step above.
<details><summary>Reveal final reference</summary>

```js
// State
let selectedStoreId = null;

// Renderer
function renderPackList() {
  const packs = getPacks();
  if (selectedStoreId === null) {
    const listItems = packs.map(p => `<li data-id="${p.id}" data-type="pack">${p.name}</li>`);
    return `<ul id=\"packList\">${listItems.join("")}</ul>`;
  }
  const selectedStoreInventory = getStorePacks().filter(sp => sp.storeId === selectedStoreId);
  if (selectedStoreInventory.length === 0) {
    return `<p id=\"packList\">(No packs available at this store.)</p>`;
  }
  const listItems = selectedStoreInventory.map(sp => {
    const pack = packs.find(p => p.id === sp.packId);
    if (!pack) return `<li>(Unknown pack #${sp.packId}) — Qty: ${sp.quantity}</li>`;
    return `<li data-id=\"${pack.id}\" data-type=\"pack\">${pack.name} — Qty: ${sp.quantity}</li>`;
  });
  return `<ul id=\"packList\">${listItems.join("")}</ul>`;
}

// Initial render
mainContainer.innerHTML = storeSelect() + renderPackList();

// Listener
selectEl.addEventListener("change", (event) => {
  const value = event.target.value;
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
```
</details>

---

## Navigation

[← Previous Chapter](./sakuras-cards-chapter-5.md)

---


