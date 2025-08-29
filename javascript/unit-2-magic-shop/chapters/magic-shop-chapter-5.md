
# Chapter 5: Modular Magic — Extracting the Data

In this chapter, you’re going to start splitting up your code into multiple modules. This helps:

* Make each file easier to read and understand
* Organize your project so different kinds of code live where they belong
* Build the habit of knowing what code is in which module and how it connects

**This chapter focuses on moving the product data out of your main JavaScript file into a separate file called `data.js`.**


[← Previous Chapter](./magic-shop-chapter-3.md) | [Next Chapter →](./magic-shop-chapter-6.md)
A module is just a JavaScript file that can *export* code (variables, functions, classes) so other modules can *import* and use it.

Modules keep their code private unless you explicitly export it and import it somewhere else.

---

### What You’ll Do

1. **Create a new file called `data.js`.**

2. **Cut the `inventory` array from your main JavaScript file.**

3. **Paste it into `data.js` and export it by adding `export` before the array declaration, like this:**

```js
export const inventory = [
  // your full product array here
];
```

4. **In your main JavaScript file, import the inventory array by adding this line at the top:**

```js
import { inventory } from './data.js';
```

5. **Update your `index.html` file’s script tag to use `type="module"` so the browser knows to load modules:**

```html
<script type="module" src="main.js"></script>
```

6. **Reload your page in the browser and verify that everything still works as expected.**

---

### Why Modularize?

* Keeps your code cleaner and easier to maintain
* Helps you and others find code faster
* Enables code reuse
* Makes bigger projects manageable

---

### Common Error

If you forget to import the data after moving it, your code will fail with an error like:

```
Uncaught ReferenceError: inventory is not defined
```

This is because modules do not share variables globally — you must import what you want to use.

---

When you’re ready, move on to the next chapter:
[← Previous Chapter](./magic-shop-chapter-3.md) | [Next Chapter →](./magic-shop-chapter-5.md)

---