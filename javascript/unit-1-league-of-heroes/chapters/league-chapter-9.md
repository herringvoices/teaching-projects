# **League of (Somewhat) Super Heroes: Chapter 8**

## **Connecting the Dots: Assigning Cities to Heroes (Nested Loops in Plain English)**

*You’ve collected heroes, let them pick cities, and recorded that info in your objects. Now it’s time to flex those skills: show, for each hero, which city they’re protecting! You’ll do this with a “nested” for...of loop and a narrative that makes it totally clear what’s happening at every step.*

---

### **Learning Objectives & Competencies**

By the end of this chapter, you should be able to:

* Use a nested `for...of` loop to relate items from two different arrays (heroes and cities)
* Compare object properties to find a match
* Use dot notation to access properties of objects in each loop
* Build up a display string using the results of your matching

---

## **Step 1: Make a Place in Your HTML to Display Assignments**

In your HTML, add this div where you want to show which hero is assigned to which city:

```html
<div id="heroCityAssignments" style="margin-top:2em;"></div>
```

> 🧹 Cleanup Callout: Ensure there’s only one `<div id="heroCityAssignments">` in your HTML. If you created any earlier placeholders or duplicates, delete them.

---

## **Step 2: Reference the Assignments Div in Your JS**

At the top of your `main.js`, grab your new div:

```js
const heroCityAssignmentsDiv = document.getElementById('heroCityAssignments');
```

> 🧹 Cleanup Callout: Keep a single DOM reference at the top of your file. Delete duplicate `const heroCityAssignmentsDiv = ...` lines elsewhere.

---

## **Step 3: Write the Function to Assign Cities to Heroes**

Add this function to your `main.js`:

```js
function renderHeroCityAssignments() {
    let assignmentsHtml = "<h2>City Assignments</h2><ul>";

    // Outer loop: go through every hero
    for (const hero of heroes) {
        let assignedCityName = "Unknown";

        // Inner loop: go through every city
        for (const city of cities) {
            if (hero.cityId === city.id) {
                assignedCityName = city.name;
                break; // Stop searching once we’ve found a match!
            }
        }
        assignmentsHtml += `<li>${hero.name} is assigned to ${assignedCityName}.</li>`;
    }

    assignmentsHtml += "</ul>";
    heroCityAssignmentsDiv.innerHTML = assignmentsHtml;
}
```

> 🧹 **Cleanup Callout:**
>
> • **Keep only one assignments function.** Make sure the `renderHeroCityAssignments()` function is the only version in your file.
>
> • **Delete any ad-hoc or earlier attempts** at city assignment logic so this function is your single source of truth.


---

## **Step 4: Call This Function Whenever the League Changes**

Whenever you add a new hero (at the end of your button handler), call:

```js
renderHeroCityAssignments();
```

> 🧹 Cleanup Callouts (finalizing your handler):
>
> • Remove leftover `console.log` lines like `"Current League Roster"`—your UI now shows the data.
>
> • Your button’s click handler should do exactly these steps, in order, with no duplicates:
>
>   1. Read inputs (including `citySelect`)
>
>   2. Coerce `cityId` to a number via `parseInt`
>
>   3. Build hero object `{ id, name, power, cityId }`
>
>   4. Push to `heroes`
>
>   5. Increment `nextHeroId`
>
>   6. Show welcome message
>
>   7. Clear inputs
>
>   8. `renderLeagueRoster()`
>
>   9. `renderHeroCityAssignments()`
>
> • Ensure there is only one `joinButton.onclick` handler in your file. Delete older versions so this final one is the only source of truth.

---

## **How Does This Work? A Narrative Example**

Let’s really act this out.

Imagine your data looks like this:

```js
const heroes = [
    { id: 1, name: "Photon Punch", power: "Super Strength", cityId: 2 },
    { id: 2, name: "The Breeze", power: "Flight", cityId: 4 }
];

const cities = [
    { id: 1, name: "Metroville" },
    { id: 2, name: "Gotham Heights" },
    { id: 3, name: "Starbridge City" },
    { id: 4, name: "Ocean Point" }
];
```

And your loop runs like this:

```js
for (const hero of heroes) {
    let assignedCityName = "Unknown";
    for (const city of cities) {
        if (hero.cityId === city.id) {
            assignedCityName = city.name;
            break;
        }
    }
    console.log(`${hero.name} is assigned to ${assignedCityName}.`);
}
```

---

### **Walking Through the Loops (In Human English):**

**First hero:**

> “I’m looking at Photon Punch. They have cityId 2.
> Let’s check the cities—Metroville? No. Gotham Heights? Yes! city.id is 2, just like Photon Punch’s cityId.
> I’ll remember Gotham Heights for Photon Punch and stop looking at cities.
> Now, I’ll display: Photon Punch is assigned to Gotham Heights.”

**Second hero:**

> “Now I’m looking at The Breeze. They have cityId 4.
> Metroville? Nope. Gotham Heights? Nope. Starbridge City? Nope. Ocean Point? Yes! city.id is 4.
> I’ll remember Ocean Point for The Breeze and stop looking at cities.
> Now, I’ll display: The Breeze is assigned to Ocean Point.”

---

## **Let’s Connect the Code and the Logic**

* **Outer loop:**
  “Give me one hero at a time.”
* **Inner loop:**
  “For that hero, check every city: does this city’s id match the hero’s cityId?”
* **If match found:**
  “Remember the city’s name and break out of the loop—no need to keep checking.”
* **After both loops:**
  “Show which hero is assigned to which city.”

---

## **Dot Notation Reminder**

Inside both loops, you can use:

* `hero.name`, `hero.cityId`
* `city.name`, `city.id`

That’s how you grab the info you need for your comparison and display!

---

## **Step 5: Try It Out**

* Add a couple of heroes with different cities.
* You should see something like:

  * “Photon Punch is assigned to Gotham Heights.”
  * “The Breeze is assigned to Ocean Point.”

---

## **What If There’s No Match?**

* If a hero has a cityId that doesn’t match any city, they’ll be “assigned to Unknown.”
* This is a good reason to keep your data clean—or give every hero a valid cityId!

---

## **Recap**

* You related two separate pieces of data (heroes and cities) using a nested loop.
* You compared properties using dot notation.
* You now have a real, dynamic way to show which heroes protect which cities.

---

**Want more challenge?**
Try listing the city *first*, then all the heroes assigned to it! (Hint: You’d reverse the loops.)

---
[← Previous Chapter](./league-chapter-8.md)
