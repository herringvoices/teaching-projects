
# Chapter 3: Clicking on Packs

The packs are finally showing up on Sakura’s site—but her customers aren’t satisfied. Now they’re clamoring: *“What’s inside these packs? Show us the cards!”* It’s time to make the packs interactive.

---

## Learning Objectives

By the end of this chapter, you should be able to:

* Add hidden state to the DOM using `data-` attributes.
* Attach a document-level click event listener.
* Use `event.target.dataset` to get the `id` of a clicked item.
* Use **`.filter()`** to find only the cards that match a certain condition.

---

## Technical Vocabulary

| Term           | Definition                                                                         |
| -------------- | ---------------------------------------------------------------------------------- |
| Event Listener | Code that waits for something to happen (like a click) and then runs.              |
| Event Target   | The specific element that was clicked or interacted with.                          |
| Dataset        | An object containing all the `data-` attributes from an HTML element.              |
| `.filter()`    | A JavaScript method that makes a *new array* with only the items that pass a test. |

---

## Step 0: Files & Imports

In **`main.js`**, import the cards getter you’ll  by adding `getCards` to your `database.js` import:

```js
// scripts/main.js
import { getCards } from "./database.js";
```

---

## Step 1: Add Hidden Info with `data-` Attributes

We’re going to attach tiny **labels** to each `<li>` so our JavaScript can tell **which pack** was clicked later.



**What are `data-` attributes?** They’re a safe way to put small bits of extra information on an element (like a sticker). Later, we can read them in JavaScript via `element.dataset`.

**Edit this in `main.js`.** Update your `renderPackList` function so each `<li>` carries two pieces of hidden info:

* `data-id` → the pack’s unique number
* `data-type` → a simple label so we know it’s a pack item

```js
// We show the name, but also tuck useful info into data- attributes

  const listItems = packs.map(pack => `<li data-id="${pack.id}" data-type="pack">${pack.name}</li>`);
```

Now each list item carries **hidden info** that JavaScript can read later with `event.target.dataset`.

---

## Step 2: Learning `.filter()`

Before wiring up any clicks, let’s practice `.filter()` on something simple so you see how it works.

### Meet the club bouncer

Think of `.filter()` like a bouncer at a club. You give them a rule, and they only let in people who meet that rule.

```js
const people = [
  { name: "Alex",   isCool: true  },
  { name: "Brianna", isCool: false },
  { name: "Carla",   isCool: true  }
];

// Only let the cool people inside
const coolPeople = people.filter(person => person.isCool === true);
// coolPeople is now [ { name: "Alex", isCool: true }, { name: "Carla", isCool: true } ]
```

### Now with cards

Assume each `card` has a `packId`. If we want only the cards from pack `7`:

```js
const allCards = getCards();
const cardsFromPack7 = allCards.filter(card => card.packId === 7);
```

**Big idea:** `.filter()` takes a big list and gives you back a smaller list that matches your rule.

---

## Step 3: Listen for Clicks + Use `.filter()` *(in `main.js`)*

Goal: Add a single click listener that (1) detects a pack `<li>` click, (2) finds its related cards, and (3) shows them.

Where to put this: In `main.js`, under your imports and after your initial render from Chapter 2.

Build it step-by-step. For each sub-step: read the instruction, try to write the code yourself, then (only if needed) open the reveal to check. Each reveal shows only the new line(s) you add in that sub-step. At the end you can reveal the full solution to check your work.

### Sub-Step 1: Attach a document-level click listener
Instruction: Add a click event to the document with `document.addEventListener` so you can handle all future clicks with one listener.
<details>
  <summary>Reveal Sub-Step 1 code</summary>

```js
document.addEventListener("click", (event) => {
  // more steps go here
});
```
</details>

### Sub-Step 2: Capture the exact element clicked
Instruction: Inside the listener, store `event.target` in a variable named `itemClicked`.
<details>
  <summary>Reveal Sub-Step 2 code</summary>

```js
  const itemClicked = event.target;
```
</details>

### Sub-Step 3: Guard so only pack `<li>` clicks continue
Instruction: Add an `if` that checks `itemClicked.dataset.type === "pack"`. Put remaining steps inside it.
<details>
  <summary>Reveal Sub-Step 3 code</summary>

```js
  if (itemClicked.dataset.type === "pack") {
    // remaining logic
  }
```
</details>

### Sub-Step 4: Read and parse the pack's id
Instruction: Inside the `if`, read `data-id`, convert it to a number, store in `packId`.
>**Note:** Remember that `data-`attributes are stored in `event.target.dataset`
<details>
  <summary>Reveal Sub-Step 4 code</summary>

```js
    const packId = parseInt(itemClicked.dataset.id);
```
</details>

### Sub-Step 5: Get all cards
Instruction: Create a variable called `allCards` and set it equal to `getCards()`.
>**Note:** Remember that `getCards` returns an array of card objects from our database.
<details>
  <summary>Reveal Sub-Step 5 code</summary>

```js
    const allCards = getCards();
```
</details>

### Sub-Step 6: Filter for only the cards in this pack
Instruction: Declare a variable called `cardsInPack`. Filter through `allCards` so that only cards where `card.packId === packId` are added to the `cardsInPack` array.
<details>
  <summary>Reveal Sub-Step 6 code</summary>

```js
    const cardsInPack = allCards.filter(card => card.packId === packId);
```
</details>

### Sub-Step 7: Build a readable string of card names
Instruction: Map those cards to their `name` and `join` with `", "` into `cardNames`.
<details>
  <summary>Reveal Sub-Step 7 code</summary>

```js
    const cardNames = cardsInPack.map(card => card.name).join(", ");
```
</details>

### Sub-Step 8: Show the result
Instruction: Use `alert` to display the list.
<details>
  <summary>Reveal Sub-Step 8 code</summary>

```js
    alert(`This pack contains: ${cardNames}`);
```
</details>

### Full Solution
Open this only after you've tried assembling it yourself.

<details>
  <summary>Reveal full event listener code</summary>

```js
// main.js
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
```
</details>

### Quick Recap
1. One listener for all clicks.
2. Grab the exact element clicked.
3. Ignore clicks that aren't pack items.
4. Read the hidden `data-id`.
5. Load cards.
6. Filter to the related ones.
7. Prepare a friendly string.
8. Show it.

---

## Step 4: Try It Out

Refresh your browser and click on a pack. You should see an alert with all the card names that belong to that pack.

---

## Step 5: Comment Your Code

Go back to your `main.js` and add comments explaining *each line in your own words*. Try to do it without looking back at the guide! (Pretend you’re leaving notes for a future version of yourself who forgot how this works.)

---

## Reflection

* You’ve now connected **two entities** from your ERD: Packs and Cards.
* `.filter()` helped you shrink a big list (all cards) into just the ones you needed (the cards in one pack).
* By storing the pack’s id in a hidden `data-id`, you gave your JavaScript the clue it needed to find related cards.
* This is your first taste of *interactivity powered by relationships*—and it’s only going to grow from here.

---

## Navigation

[← Previous Chapter](./sakuras-cards-chapter-2.md) | [Next Chapter →](./sakuras-cards-chapter-4.md)

## Consistency Check

* The **pack list renders** on page load (from Chapter 2).
* Clicking a pack **alerts its cards**.
* Only Packs ↔ Cards behavior exists so far (stores come later).
