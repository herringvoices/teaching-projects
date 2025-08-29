# **League of (Somewhat) Super Heroes: Chapter 1**

## **Welcome to the League!**

*You’ve been summoned. The League of (Somewhat) Super Heroes needs new recruits. Your mission? Build a program that welcomes every new hero into the League—starting with yourself!*

---

### **Learning Objectives & Competencies**

By the end of this chapter, you should be able to:

* Define and invoke a JavaScript function
* Use string interpolation with template literals
* Display output in the browser console
* Link a JavaScript file to an HTML file with a `<script>` tag

---

## **Technical Vocabulary**

| Term             | Definition                                                                  |
| ---------------- | --------------------------------------------------------------------------- |
| Function         | A reusable block of code designed to perform a specific task                |
| Parameter        | A variable in the function definition that receives a value when called     |
| Argument         | The actual value you pass to a function when you invoke it                  |
| Return Value     | The output that a function “gives back” when it finishes running            |
| Template Literal | A string defined with backticks (\`) that allows embedding variables easily |
| Interpolation    | Inserting the value of a variable directly into a string                    |
| Console          | A tool in your browser where developers can view output and debug code      |

---

## **Step 1: Set Up Your Project**

1. **Create a new folder for your League project.**

   * Right-click in your workspace in VS Code and choose “New Folder.”
   * Name it `league-of-superheroes`.

2. **Inside that folder, create two new files:**

   * `index.html`
   * `main.js`

3. **Open both files in VS Code.**

---

## **Step 2: Boilerplate HTML**

Here’s your starter HTML. Copy and paste this into your `index.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>League of (Somewhat) Super Heroes</title>
</head>
<body>
    <h1>Welcome to the League!</h1>
    <form>
      <label for="heroNameInput">Hero Name</label>
      <input type="text" id="heroNameInput"/>
      <button id="joinButton">Join</button>
    </form>
    <div id="welcomeMessageDiv"></div>
    <script src="main.js"></script>
</body>
</html>
```

### **🚩 Important:**

* The line `<script src="main.js"></script>` links your JavaScript file.
  This tells the browser, “Hey, I’ve got some JS for you to run!”
  (If your file is in a subfolder, adjust the path accordingly.)

* Always put your `<script>` tag **right before the closing `</body>` tag** or at the end of the `<body>`.
  That way, your HTML is loaded before your JS tries to mess with it.

---

## **Step 3: The Console Is Your Friend**

We won’t show anything on the actual web page (yet)—we’ll use the **browser console** to see our work.

* In VS Code, click “Go Live” (Live Server extension).
* In your browser, right-click the page and select **Inspect** (or press `Ctrl+Shift+I`), then go to the **Console** tab.

---

## **Step 4: Write Your First Function**

Open `main.js` and type this function:

```js
const welcomeHero = (heroName) => {
    return `Welcome to the League, ${heroName}!`;
}
```

### **String Interpolation? What’s That?**

* See those backticks `` ` ``? They’re usually on the top-left of your keyboard, just under the **Escape** key.
  (They look like a slouching apostrophe.)
* Using backticks lets you insert variables right into the string like this: `${variable}`.
* It’s way easier (and cooler) than writing `"Welcome to the League, " + heroName + "!"`

---

## **Step 5: Try Out Your Function**

Right below your function, add:

```js
const heroGreeting = welcomeHero("Athena Thunderpunch");
console.log(heroGreeting);
```

* Save the file.
* Look at your browser’s console.
  You should see:
  `Welcome to the League, Athena Thunderpunch!`

Try it again with your own superhero name!

---

## **Recap & Reflection**

**You just wrote your first function!**
You learned about:

* Writing a function that takes a parameter (the hero’s name)
* Returning a string with that name *interpolated* inside it
* Logging output to the console using `console.log()`
* The power of backticks (template literals) for string interpolation
* How the browser console helps you see what your code is doing

**Victory pose. You earned it.**

---

### **Next Up**

In the next chapter, we’ll build a way for users to type in a hero’s name and see that welcome message appear on the page (not just in the console). You’re one step closer to a full-on superhero registration app.

---

**Questions? Errors?**
If something didn’t work, check:

* Did you save both files?
* Did you link `main.js` with the `<script>` tag?
* Did you spell everything the same way? (JavaScript is case-sensitive!)
* Did you open the browser console?

If all else fails, ask your friendly neighborhood instructor or sidekick.

---
[Next Chapter →](./league-chapter-2.md)
