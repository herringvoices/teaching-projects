# **League of (Somewhat) Super Heroes: Chapter 6**

## **Meet the Squad: Rendering Your League (Loops & Dot Notation)**

*You’ve been building your League one hero at a time. Now it’s time to actually see your full roster right on the page! You’ll use a `for...of` loop (which you’ll really understand by the end) to show all your heroes and their powers.*

---

### **Learning Objectives & Competencies**

By the end of this chapter, you should be able to:

* Use a `for...of` loop to access every object in an array
* Use dot notation to get properties from objects inside a loop
* Dynamically build and display a list of heroes and their powers in the DOM
* Understand what each part of the loop is doing—no “just copy this” required!

---

## **Step 1: Add a Place to Show Off the League**

In your `index.html`, add a div where the roster will show up (if you haven’t already):

```html
<div id="leagueRoster" style="margin-top:2em;"></div>
```

---

## **Step 2: Grab the Roster Div in Your JS**

Up at the top of your `main.js`, add:


```js
const leagueRosterDiv = document.getElementById('leagueRoster');
```
Make sure you already have these from earlier chapters:

```js
const heroNameInput = document.getElementById('heroNameInput');
const heroPowerInput = document.getElementById('heroPowerInput'); // added in Chapter 5
const joinButton = document.getElementById('joinButton');
const welcomeMessageDiv = document.getElementById('welcomeMessageDiv');
const heroes = []; // Chapter 4 (now an array of objects since Chapter 5)
let nextHeroId = 1; // Chapter 5
```

> 🧹 **Cleanup Callouts:**
>
> • **Delete any quick roster display experiments** you may have tried earlier (like writing straight to `innerHTML` inside the button click). From now on, always use the `renderLeagueRoster()` function to handle showing the team.
>
> • **Put all your important variables in one place.** At the very top of your file, keep just one set of these:
>
> * `heroNameInput`
> * `heroPowerInput`
> * `joinButton`
> * `welcomeMessageDiv`
> * `leagueRosterDiv`
> * `heroes`
> * `nextHeroId`
>   If you see duplicates of these further down in your code, delete them so your setup is tidy and easy to find.

---

## **Step 3: Write a Function to Display the League**

This is where the magic happens—but let’s break down *every part* so you’re not just waving a wand.

```js
function renderLeagueRoster() {
  // 1. Start building your HTML string.
  let rosterHtml = "<h2>League Roster</h2><ul>";

  // 2. Loop through your heroes array, one hero at a time.
  //    The variable 'hero' will be a DIFFERENT hero object each time!
  for (const hero of heroes) {
    // - 'hero' is the CURRENT hero object from the array.
    // - Dot notation (hero.name, hero.power) lets us read properties.
    rosterHtml += `<li>${hero.name} — <em>${hero.power}</em></li>`;
  }

  // 3. Close the list.
  rosterHtml += "</ul>";

  // 4. Put the finished HTML string into the leagueRosterDiv on the page.
  leagueRosterDiv.innerHTML = rosterHtml;
}
```
---

## **Step 4: Call the Function When You Add Heroes**

Now you need to actually *use* this function! The best place is right after you add a new hero to your array.

In your existing `joinButton.onclick` handler (from Chapters 2–5), add a call to `renderLeagueRoster()` at the end. Here’s what your full click handler can look like now, aligned with your current variables and IDs:

```js
joinButton.onclick = () => {
  // Build a hero object from the inputs (Chapter 5)
  const newHero = {
    id: nextHeroId,
    name: heroNameInput.value,
    power: heroPowerInput.value
  };

  // Add to the league (array of hero objects)
  heroes.push(newHero);

  // Prepare for the next hero
  nextHeroId++;

  // Show a friendly welcome message (existing behavior)
  welcomeMessageDiv.textContent = welcomeHero(newHero.name);

  // Optional: peek at the data in the console
  console.log("Current League Roster:", heroes);

  // Clear inputs
  heroNameInput.value = "";
  heroPowerInput.value = "";

  // NEW: render the full roster on the page
  renderLeagueRoster();
};

> 🧹 Cleanup Callout: Update to this Chapter 6 click handler and delete all earlier versions so there’s only one `joinButton.onclick` in your file.
```

**What's happening here?**

* Every time someone adds a new hero, the `renderLeagueRoster()` function runs automatically.
* This means your roster display will update immediately when a new hero joins the league!
* No manual refresh needed—it's all dynamic.
---

## **Let’s Break Down That Loop (Line by Line):**

### **This code:**

```js
for (const hero of heroes) {
  rosterHtml += `<li>${hero.name} — <em>${hero.power}</em></li>`;
}
```

### **What’s happening, exactly?**

#### **for (const hero of heroes) { ... }**

* **for** — Means we’re about to repeat something multiple times (once for each item in a list).
* **const hero** — For each run through the loop, create a new variable called `hero`.
* **of heroes** — “Take each item from the `heroes` array, one at a time, and put it in `hero`.”
* **The block `{ ... }`** — Everything inside the curly braces runs for *each* hero.

**You could write:**

```js
for (const taco of heroes) {
    // 'taco' is each hero object, one at a time!
    // You’d use taco.name, taco.power, etc.
}
```

The variable name is your choice—just pick something that makes sense for what’s inside your array.

#### **Dot Notation:**

* Since each `hero` is an *object*, you use “dot notation” to grab its properties:

  * `hero.name` — the current hero’s name
  * `hero.power` — the current hero’s superpower

#### **Putting It All Together:**

* On the **first** loop, `hero` is the first hero in your array, so `hero.name` is that hero’s name.
* On the **second** loop, `hero` is the next hero, and so on.
* You add a new `<li>` to your growing HTML string for each hero.

---

### **Visualizing the Flow:**

If `heroes` looked like this:

```js
[
  { id: 1, name: "Photon Punch", power: "Super Strength" },
  { id: 2, name: "The Breeze", power: "Flight" }
]
```

Then your loop would do:

* First run:
  `hero = { id: 1, name: "Photon Punch", power: "Super Strength" }`
  Adds: `<li>Photon Punch — <em>Super Strength</em></li>`
* Second run:
  `hero = { id: 2, name: "The Breeze", power: "Flight" }`
  Adds: `<li>The Breeze — <em>Flight</em></li>`

---

### **End of the Loop:**

Once you’re out of heroes, the loop stops, and your string `rosterHtml` contains all those `<li>`s.

Then, this line:

```js
leagueRosterDiv.innerHTML = rosterHtml;
```

— takes your full HTML string and puts it right into your roster div on the page!



---

**Summary:**

* The loop goes one-by-one through every hero object in your array.
* The variable (`hero`) is your “handle” on each hero as you loop.
* Dot notation lets you pull out their `name` and `power`.
* The result: a complete, live-updating team list right on your web page.

---
[← Previous Chapter](./league-chapter-5.md) | [Next Chapter →](./league-chapter-7.md)
