# Chapter 2: Debug Like a Wizard – Understanding Error Types

Welcome to debugging, the *real* magic of programming.
This is where you learn to listen to your code, follow the clues, and solve mysteries—sometimes with the help of a friendly (or not-so-friendly) error message.

In this chapter, you’ll:

* Learn what an **error type** is and spot the ones you’ll see most,
* Decode a real error from your Magic Shop project (and fix it!),
* And practice debugging when the browser doesn’t even *tell* you what’s wrong.

---

## What’s an “Error Type”?

When something goes wrong in JavaScript, you don’t just get a vague “bad vibes detected” message. You get a specific **error type**—a label for what kind of problem occurred.

**Here are some common error types you’ll see:**

| Error Type     | What It Means                                        | Example Error Message                    |
| -------------- | ---------------------------------------------------- | ---------------------------------------- |
| ReferenceError | Used a variable or function that hasn’t been defined | `ReferenceError: foo is not defined`     |
| TypeError      | Did something with a value that doesn’t make sense   | `TypeError: undefined is not a function` |
| SyntaxError    | Code is written in a way JavaScript can’t even parse | `SyntaxError: Unexpected token }`        |
| RangeError     | Used a number outside an allowed range               | `RangeError: Invalid array length`       |

---

## Your First Real Error: Let’s Follow the Clues

You open up your Magic Shop, and…
**BAM!** Red text in the Console. Time to put on your detective hat.

Here’s the error you see:

```
Uncaught ReferenceError: item is not defined
    at isBargain (main.js:17:5)
    at main.js:49:9
```

Let’s walk through this, clue by clue.

---

### Step 1: Look at the Error Message

* **Uncaught ReferenceError: item is not defined**
  The error type is **ReferenceError**.
  Translation: You tried to use a variable named `item`, but JavaScript doesn’t know what that is (it hasn’t been defined in the current scope).

---

### Step 2: Find Where the Error Happened

The error also tells you:

* `at isBargain (main.js:17:5)`
* `at main.js:49:9`

Here’s what that means:

* `main.js:17:5`

  * The error is in `main.js`, line 17, **column 5** (that’s the fifth character on that line—helpful for *very* long lines, but you can usually ignore the column number).
* `at main.js:49:9`

  * That’s where the `isBargain` function was *called*—line 49, column 9.

---

### Step 3: Let’s Follow the Trail

**Let’s check out line 17**—the code for `isBargain`:

```js
const isBargain = (magicItem) => {
    if (item.price < 50.00) {
        return true;
    }
    return false;
};
```

Wait a minute… The function accepts a parameter called `magicItem`, but inside the function it uses `item`.
There’s no `item` defined in this function! That’s exactly what the error is telling us.

Let’s double-check what *should* be happening by looking at **where this function is called** (the error also pointed us to line 49):

```js
const bargains = [];
for (const item of inventory) {
    if (isBargain(item)) {
        bargains.push(item);
    }
}
```

* Here, we’re looping over every `item` in the `inventory` array and passing it into `isBargain`.

So:

* The parameter of `isBargain` should be called `item` (since that’s what we pass in), **or** we should use `magicItem` inside the function.
* The key thing is: the variable you use inside the function **must match the parameter name**.

---

### Step 4: Fixing the Error

**Two good ways to fix this:**

1. Change the parameter so everything matches:

   ```js
   const isBargain = (item) => {
       if (item.price < 50.00) {
           return true;
       }
       return false;
   };
   ```
2. Or, use the existing parameter name everywhere inside the function:

   ```js
   const isBargain = (magicItem) => {
       if (magicItem.price < 50.00) {
           return true;
       }
       return false;
   };
   ```

*Pick one, and stick with it! The code and the error will disappear, and your Bargains will finally appear.*

---

## Debugging Pro Tips

* **Error types** are your first clue—“ReferenceError” usually means a misspelled variable, or you forgot to define it.
* **The line number** (and file name) is your map. The **column number** is rarely helpful unless you’re on a wild goose chase.
* **Follow the call chain**: Where did the function break, and where was it called?
  Checking both helps you understand what should be happening and what actually *is* happening.

---

## Debugging with No Error Messages: The Wands List Mystery

Sometimes, the browser won’t shout at you—it’ll just… silently fail. That’s *arguably* worse.

For example, let's say you tracked down and fixed all the error messages, and now you’re looking at your shop. But the **Wands** list is empty, and the Console has nothing to say. What gives?

Let’s investigate:

Let’s follow the logical flow of how the Wands list is generated. Start by noticing what isn't loading—the Wands list on the page. Everything else is working, so our issue must be somewhere in the steps that decide what counts as a wand and how that list is built. To figure this out, we should start from where the Wands get rendered on the page and work our way backwards:

* How does the Wands list get displayed in the DOM?
* What array is used to display it, and how is that array created?
* What criteria are we using in our code to decide if something is a wand?

If we trace the code backwards, we'll eventually end up looking at the `isWand` function:

```js
const isWand = (product) => {
    if (product.price === "wand") {
        return true;
    }
    return false;
};
```

Let’s read this like a code detective:

* The `product` parameter comes from the `inventory` array. Let’s look at a product:

  ```js
  { id: 3, description: "Wand of Unending Sneeze", price: 349.99, type: "wand" }
  ```
* The `price` is a number (e.g., 349.99), and the `type` is a string (e.g., "wand").

But in the function, we’re checking:

```js
if (product.price === "wand")
```

That’s comparing a number (`product.price`) to the string (`"wand"`).
That’s never going to be true—no error, just a logic fail!

**How do we fix this?**
We want to check the product’s `type` instead:

```js
const isWand = (product) => {
    if (product.type === "wand") {
        return true;
    }
    return false;
};
```

Now, your Wands list should *magically* fill up!

---

## Debug the Rest of the Project!

Now it’s your turn to play Debug Detective.
Go through the rest of the starter code and hunt down any errors or bugs you can find—whether the Console points them out or your eyes do! Check the mockup from the previous chapter when you're done to make sure your project is working as expected.

Remember:

* If you see an error in the Console, follow the clues—read the error type, the message, and the line number.
* If something’s not working but there’s no error, check your logic:

  * Are you comparing the right things?
  * Are you spelling properties and variables the same everywhere?
  * Does the function do what you *think* it’s doing?

**Welcome to real programming. You’ve got this!**

---

[← Previous Chapter](./magic-shop-chapter-1.md) | [Next Chapter →](./magic-shop-chapter-3.md)
