# **League of (Somewhat) Super Heroes: Chapter 8**

## **Assigning Cities: Adding the City to Each Hero**

*Now that heroes can pick a city, let’s actually store that choice! In this chapter, you’ll modify your hero-adding code so each hero object knows what city they defend. Along the way, you’ll meet a new tool: `parseInt`, which helps turn that city value from a string into a number—making your data trustworthy and ready for future features!*

---

### **Learning Objectives & Competencies**

By the end of this chapter, you should be able to:

* Capture the user’s selected value from a `<select>` element
* Use `parseInt` to convert a string to a number
* Add a new property to your hero objects (cityId)
* Use the debugger or console to inspect your object and confirm it worked

---

## **Step 1: Capture the City ID When Adding a Hero**


Inside your button click handler, you'll add a line to grab the chosen city's value. Here's what your button click handler should look like with all the input gathering together:

```js
// Inside your button click handler:
const heroName = heroNameInput.value;        // Get the hero name
const heroPower = heroPowerInput.value;      // Get the hero power
const cityIdString = citySelect.value;       // Get the selected city (as string)
```

* `.value` gets the currently selected `<option>`’s value from your dropdown.
* But! This value is a **string**, not a number (any value you get directly from the DOM will be a string)

---

## **Step 2: Convert the String to a Number**

We want our hero’s `cityId` property to be a number so it matches your city data (and future code won’t break).

**Add:**

```js
const cityId = parseInt(cityIdString);
```

* `parseInt` takes a string like `"2"` and gives you the number `2`.
* This makes it easier to match the city later (with `===`).

---

## **Step 3: Update Your Hero Object**

When you build your `newHero` object, add a `cityId` property:

```js
const newHero = {
    id: nextHeroId,
    name: heroNameInput.value,
    power: heroPowerInput.value,
    cityId: cityId // Add the numeric cityId property
};
```

> 🧹 Cleanup Callouts:
>
> • Replace your old `newHero` object (without `cityId`) with this new shape that includes `cityId`.
>
> • Make sure you convert the city select value to a number using `parseInt` before assigning to `cityId`. Delete any leftover code that uses the string value directly.

---

## **Step 4: Confirm It Worked (Debugging!)**

Add a `console.log(newHero)` line before you push your new hero to the array, or use a breakpoint in your browser's dev tools!.

* Make sure the hero’s `cityId` property matches the city you picked (and it’s a number).
* Try switching cities—watch how the `cityId` changes!

---

## **Let’s Break Down the Key Parts:**

```js
const cityIdString = citySelect.value; // gets a string, e.g. "3"
const cityId = parseInt(cityIdString); // converts to a number, e.g. 3
```

* Why not just store it as a string? Sometimes `"2" == 2` will work, but `"2" === 2` is *false* (because one is a string, the other a number). This can cause annoying bugs.
* It’s best to keep your data types consistent!

---

## **Why Are We Doing This?**

* Linking the hero and city with a shared id means you can do more interesting things—like displaying which hero is in which city (coming up next!).
* Practicing `parseInt` now will save you confusion down the line when data types matter.

---

## **Recap**

* You captured a selected value from a dropdown.
* You converted it to a number with `parseInt`.
* You stored the city ID in your hero object.
* You checked your work using the console or debugger!

---

**Next up:**
You’ll use that city ID to *display* which hero is defending which city—practicing your first nested loop and really bringing it all together!
---
[← Previous Chapter](./league-chapter-7.md) | [Next Chapter →](./league-chapter-9.md)
