# **League of (Somewhat) Super Heroes: Chapter 4**

## **Assembling the League (Introducing Arrays)**

*You’ve greeted heroes one at a time. Now it’s time to start building your dream team! In this chapter, you’ll learn to store and manage a growing list of heroes—because every league is more powerful together.*

---

### **Learning Objectives & Competencies**

By the end of this chapter, you should be able to:

* Declare and use a JavaScript array
* Add new items to an array with `.push()`
* Store multiple hero names as your league grows
* View the current roster of heroes in the browser console

---

## **Technical Vocabulary**

| Term      | Definition                                                            |
| --------- | --------------------------------------------------------------------- |
| Array     | A variable that can store multiple values in a list                   |
| Element   | An individual value stored in an array (for example, one hero’s name) |
| `.push()` | An array method that adds a new item to the end of an array           |
| Index     | The position of an item in an array (first is 0, second is 1, etc.)   |
| Roster    | A fancy word for your “list of heroes” (and it sounds way cooler)     |

---

## **Step 1: Create Your League Array**

**Why do this?**
Right now, your code greets one hero at a time, but forgets about them immediately. To keep a real League, you need to store *all* the heroes as they join.

**Add this line to the very top of your `main.js` (above your function):**

```js
const heroes = [];
```

* This makes a brand new, empty array called `heroes`.
* You’ll use this to keep track of every hero who joins.

---

## **Step 2: Add Heroes to the League When They Join**

**Why do this?**
When someone clicks “Join League,” you want their name added to the team *forever* (well, until the browser tab closes).

**Change your button’s click handler to this:**

```js
joinButton.onclick = () => {
    const name = heroNameInput.value;
    const message = welcomeHero(name);

    // Add this hero’s name to the league array
    heroes.push(name);

    // Show the welcome message on the page
    welcomeMessageDiv.textContent = message;

    // Show the current roster in the console
    console.log("Current League Roster:", heroes);
};


```
> 🧹 **Cleanup Callout:**
>
> • **Replace the old button code.** If you still have the Chapter 2 version of the click handler (the one that just showed a message but didn’t add to an array), delete it.
>
> • **Keep only the new array-based click handler.** You should have exactly one `joinButton.onclick` in your file, and it should be the one that adds names to the `heroes` array.

### **Let’s walk through what’s happening:**

1. **Get the hero’s name** from the input box.
2. **Add the name to your heroes array** with `.push(name)`.
3. **Show the welcome message** on the page (as before).
4. **Show the updated roster** in your browser’s console so you can *see* the league growing.

---

## **Step 3: Test It Out!**

1. Save your files.
2. Go to your browser, type a name, and click “Join League.”
3. Open the browser console—every time you add a hero, you’ll see the full, growing array.
4. Add more than one hero and see how the league keeps track of everyone.

---

## **What Did You Just Do?**

* You created an array to store *all* your heroes’ names.
* Every time a hero joins, you added them to the array—no more lost heroes!
* You used the console to check your work and see how arrays change in real time.

---

### **Why not show the whole roster on the page yet?**

That’s coming soon! Right now, we’re building up the tools and understanding you’ll need to show *everything* in the browser.

---

## **Recap**

* Arrays let you store *lists* of things (like hero names).
* `.push()` is your tool for growing the list, one hero at a time.
* The console is your behind-the-scenes look at your growing league.

---

## **Quick Challenge**

Can you add a line that *clears* the input box after a hero joins?

---

## **Looking Ahead**

In the next chapter, your heroes will get their own superpowers, and you’ll level up your array to handle more than just names.
Your league’s about to get some real personality!

---
[← Previous Chapter](./league-chapter-3.md) | [Next Chapter →](./league-chapter-5.md)


