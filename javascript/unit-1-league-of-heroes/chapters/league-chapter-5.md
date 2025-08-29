---

# **League of (Somewhat) Super Heroes: Chapter 5**

## **More Than a Name (Objects & Superpowers)**

*Your league is about to level up: it’s time for real hero “profiles”—complete with name, power, and a unique ID! You already know how to add inputs and grab them in JS. Now, let’s build out your hero objects and roster!*

---

### **Learning Objectives & Competencies**

By the end of this chapter, you should be able to:

* Create objects to represent each hero’s information
* Add new hero objects to an array
* Generate a unique ID for each hero
* Combine multiple properties from the DOM to build objects

---

## **Step 1: Add a Superpower Input**

**Challenge:**
Add an additional input for the hero’s superpower in your HTML.
(You’ve done this before! If you get stuck, look back at previous chapters.)

**Also:**
Give that input an `id` so you can access it in JavaScript.

---

## **Step 2: Reference Your New Input in JS**

**Challenge:**
Write the code to get a reference to your new superpower input element in `main.js` (using `document.getElementById`).
You know this trick!

---

## **Step 3: Level Up—Build a Hero Object!**

Now for the *new* part:
Every time someone clicks the button, you’ll create a hero object with these properties:

* `id` (a unique number for each hero)
* `name` (from the name input)
* `power` (from the power input)

And you’ll add that object to your heroes array.

### **Here’s the code for the new parts:**

At the *very* top of your `main.js`, add:

```js
let nextHeroId = 1; // Tracks what ID to give the next hero
```

In your button’s click handler, after you’ve grabbed the name and power from the inputs, replace your old code with this:

```js
// Build a hero object
const newHero = {
    id: nextHeroId,
    name: heroNameInput.value,
    power: heroPowerInput.value
};

// Add the new hero object to your league array
heroes.push(newHero);

// Update the ID for next time
nextHeroId++;

// Display the latest hero's name in the welcome message
welcomeMessageDiv.textContent = welcomeHero(newHero.name);

// Optional: See your full league of hero objects in the console
console.log("Current League Roster:", heroes);

// Clear the input boxes so you're ready for the next hero
heroNameInput.value = "";
heroPowerInput.value = "";
```

> 🧹 Cleanup Callouts:
>
> 1) Delete any earlier `heroes.push(name)` string-only code from Chapter 4. Replace it with the object-push shown above: `heroes.push(newHero)`.
>
> 2) Ensure there is only one `let nextHeroId = 1;` at the top of your file. If you accidentally declared it twice, remove the duplicates.
>
> 3) If you added your own input-clearing lines during the Chapter 4 quick challenge, remove them and keep the official clearing shown here so there’s a single, consistent version.

---

## **Why are we doing this?**

* **Objects** allow you to bundle multiple related values (name, power, id) together.
* **Unique IDs** help you keep track of which hero is which, even if they share the same name or power.
* You’re building the foundation for storing *lots* of info about each hero—so your league is flexible and powerful!

---

## **Quick Check**

After you’ve added a few heroes:

* Open the browser console and look at the `heroes` array.
* You should see an array of objects, each with an `id`, `name`, and `power`.

---
[← Previous Chapter](./league-chapter-4.md) | [Next Chapter →](./league-chapter-6.md)


