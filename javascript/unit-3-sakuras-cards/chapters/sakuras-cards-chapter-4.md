
# Chapter 4: Evolving the Data — Many-to-Many with Stores

Sakura’s business just leveled up. Until now, you’ve only modeled **Packs → Cards** (one pack has many cards). But each **Store** can carry many different **Packs**, and each **Pack** can be carried by many **Stores**. That’s a **many-to-many** relationship, and today you’ll model it.

> You’ll swap in a new `database.js` (provided) that adds `stores` and a join table named `storePacks`. No UI changes yet. This chapter is about **data modeling**.

---

## Learning Objectives

By the end of this chapter, you should be able to:

* Explain why many-to-many relationships need a **join table**.
* Update a paper ERD to include `stores` and `storePacks`.
* **Import** the new database getters (`getStores()`, `getStorePacks()`) and read the data.


---

## Technical Vocabulary

| Term             | Definition                                                                       |
| ---------------- | -------------------------------------------------------------------------------- |
| Many-to-many     | A relationship where many records on each side can relate to many on the other.  |
| Join table       | A table that connects two tables in a many-to-many (here: `storePacks`).         |
| Foreign key (FK) | A field that points to another table’s primary key (e.g., `storePacks.storeId`). |

---

## Step 0: Get the New Database

You’ll overwrite `database.js` with an updated one that adds `stores` and the join table `storePacks`.

Run this ONE line **while inside the `sakuras-cards` folder**:

```bash
   curl -fsSL "https://raw.githubusercontent.com/herringvoices/teaching-projects/refs/heads/main/javascript/unit-3-sakuras-cards/scripts/newdata.sh" | bash
```

What it does:
* Downloads the public `newdata.sh` script
* Pipes it to bash
* Replaces `database.js` (adds `stores`, `storePacks`; keeps `packs`, `cards`)

Exports available after update (don’t edit them): `getStores()`, `getStorePacks()`, `getPacks()`, `getCards()`.

---

## Step 1: Update Your Paper ERD

On paper, redraw your ERD so it now shows **three boxes**:

* **Packs** (with `id`, and your existing 1→many to **Cards**)
* **Cards** (with `id`, `packId`)
* **Stores** (with `id`)

Then add a **fourth box** for the **join table**:

* **StorePacks**

  * `id` (PK)
  * `storeId` (FK → Stores.id)
  * `packId` (FK → Packs.id)
  * `quantity`

Draw the relationships. If you forget how, refer to the video from chapter 1.

Aim for clarity over artistry—boxes, arrows, labels.

---

## Step 2: Files & Imports *(in **********`main.js`**********)*

The database provides functions called "getters" that let us read specific collections from the database. **Import** what you need in `main.js`:

```js
// main.js
import { getStores, getStorePacks, getPacks, getCards } from "./database.js";
```

### Baseline Render (keep your list helper from Chapter 2)

Your **packs list should still render exactly like Chapter 2**. Don’t remove or change it yet. You should already have something like this in `main.js` (where `renderPackList()` is the helper you wrote earlier):

```js
const container = document.querySelector("#container");
container.innerHTML = renderPackList();
```

> We are not rendering stores yet. UI stays the same in this chapter while we evolve the **data model**.

---

## Step 3: Read the New Data (No UI Yet) *(in **********`main.js`**********)*

Open your browser’s **Console** so you can *see* the data.

1. **Open DevTools:** Right-click the page → **Inspect** → **Console**
   (Windows: **Ctrl+Shift+J** or press **F12** and open the Console tab)
2. **Add temporary logs in ********************`main.js`********************:**

```js
import { getStores, getStorePacks } from "./database.js";

console.log("stores:", getStores());
console.log("storePacks:", getStorePacks());
```

3. **Refresh** the page and look at the Console.

**What you should see**

* `stores:` followed by something like `[{ id: 1, name: "Downtown" }, { id: 2, name: "Uptown" }, ...]`
* `storePacks:` followed by something like `[{ id: 1, storeId: 1, packId: 3, quantity: 12 }, ...]`

> `[]` means an **array** (a list of rows). `{}` means an **object** (one row).
> In `storePacks`, `storeId` points to a row in **stores**, and `packId` points to a row in **packs**.

**If nothing shows up:**

* Check your script tag is `<script type="module" src="./main.js"></script>`.
* Make sure the import path is exactly `"./database.js"`.
* Save your files and refresh.

---

## Cleanup Callout

* Get rid of the `console.log`s you created in this chapter
* Don’t modify any getter functions—**import only** from `database.js`.
* Don’t change your pack rendering yet; filtering comes later.

---

## Reflection

* You expanded the model from a simple one‑to‑many (Packs → Cards) to a many‑to‑many using a join table.
* A join row (`storePacks`) stores just foreign keys + metadata (`quantity`) instead of duplicating store or pack details.
* Inspecting raw arrays helps confirm your mental ERD matches the actual data.

## Consistency Check

* `renderPackList()` still renders packs (no UI change yet).
* Console logs show arrays for `stores` and `storePacks` with expected fields.
* Paper ERD now has four boxes: Stores, Packs, Cards, StorePacks.
* No dropdown or filtering UI yet (that begins in Chapter 5).

---

## Navigation

[← Previous Chapter](./sakuras-cards-chapter-3.md) | [Next Chapter →](./sakuras-cards-chapter-5.md)
