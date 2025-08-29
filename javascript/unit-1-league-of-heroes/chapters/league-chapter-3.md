# **League of (Somewhat) Super Heroes: Chapter 3**

## **When Things Go Wrong (And Why That’s Good!)**

*Every superhero faces a setback—sometimes the villain wins a round, sometimes your code throws a fit. In this chapter, you’ll learn how to spot and understand errors in JavaScript. This isn’t just about fixing typos; it’s about learning how your code really works!*

---

### **Learning Objectives & Competencies**

By the end of this chapter, you should be able to:

* Recognize and interpret JavaScript error messages using browser developer tools
* Distinguish between **syntax errors** and **logic errors**
* Use debugging tools to investigate what went wrong
* Explain, in plain English, why an error happened and how to fix it

---

## **Technical Vocabulary**

| Term         | Definition                                                                                 |
| ------------ | ------------------------------------------------------------------------------------------ |
| Syntax Error | A problem with how you wrote the code—like a typo or missing punctuation                   |
| Logic Error  | The code *runs*, but it doesn’t do what you meant—often because of a mistake in your logic |
| Debugging    | The process of finding and fixing errors in your code                                      |
| Stack Trace  | A report shown in the console that helps you locate where in your code the error happened  |
| Console      | The tool in your browser where errors and logs are displayed                               |

---

## **Step 1: See What Happens When You Forget an Argument**

Let’s break our own code on purpose!
This is how *every* real developer learns—by breaking stuff and figuring out why it broke.

**In your `main.js`,** add this line *somewhere after your function is defined*:

```js
const mysteryHero = welcomeHero();
console.log(mysteryHero);
```

### **What should happen?**

* Open your browser’s console (Inspect → Console tab).
* Instead of seeing “Welcome to the League, Athena Thunderpunch!” you’ll see:

  ```
  Welcome to the League, undefined!
  ```

#### **Why did that happen?**

When you call `welcomeHero()` **without an argument**, the `heroName` parameter is `undefined` by default.
So your function returns:
`Welcome to the League, undefined!`

This isn’t a *syntax* error (your code is legal), but it’s a **logic error**—the code *runs*, but the result doesn’t make sense.

---

## **Step 2: Fix the Logic Error**

Update the line to provide a name:

```js
const mysteryHero = welcomeHero("Laser Possum");
console.log(mysteryHero);
```

Now your welcome message should look normal again.

> 🧹 Cleanup Callout: Delete the temporary test lines you added for this drill so they don’t stick around.
>
> Remove:
>
> ```js
> const mysteryHero = welcomeHero();
> console.log(mysteryHero);
> ```

---

## **Step 3: Cause a Syntax Error**

Let’s break the *rules* of JavaScript!

**Change your function definition to misspell “heroName”** (for example):

```js
const welcomeHero = (heroNam) => {
    return `Welcome to the League, ${heroName}!`;
}
```

Now, reload the page.

**You’ll see a red error in the console**, something like:

```
ReferenceError: heroName is not defined
```

### **Let’s break this down:**

* **ReferenceError**: You tried to use a variable that JS doesn’t recognize (`heroName` instead of `heroNam`)
* **Stack trace**: The console will show *where* in your code the error happened—usually with a line number.

#### **What do you do?**

* **Read the message.** It will usually tell you what’s wrong.
* **Check your spelling and parameter names.**
  The function is expecting `heroNam`, but you’re using `heroName` inside.

> 🧹 Cleanup Callout: Restore your function to the correct, working version and delete the broken spelling version.
>
> Ensure it’s exactly:
>
> ```js
> const welcomeHero = (heroName) => {
>   return `Welcome to the League, ${heroName}!`;
> }
> ```

---

## **Step 4: Debug Like a Pro**

**Every time you see an error:**

1. Read the console message.
   Is it a ReferenceError? SyntaxError? Something else?
2. Look for a line number—it shows *where* the error happened.
3. Ask yourself: “Is this code even running? Or is it running, but giving a weird result?”

---

## **Reflection: Why Celebrate Mistakes?**

> *“Errors are not the enemy. They’re your sidekick, telling you exactly where to look next.”*

Great coders don’t avoid errors—they *learn from them.*
Explaining *why* the error happened is more valuable than just fixing it.

---

## **Quick Quiz**

1. What happens if you call a function without providing all the arguments?
2. What’s the difference between a syntax error and a logic error?
3. Where do you look to find out why your code isn’t working?

(*Ask yourself, your pair, or shout it into the void. It all helps!*)

---

## **Recap**

* You learned how to spot, read, and explain errors.
* You practiced causing (and fixing!) both logic and syntax errors.
* You saw the value of the browser console for understanding what your code is doing.
* You learned to treat errors as clues, not catastrophes.

---

**Next up:**
You’ll finally start tracking ALL your heroes as they join the league—your first array is coming!
---
[← Previous Chapter](./league-chapter-2.md) | [Next Chapter →](./league-chapter-4.md)


