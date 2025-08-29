# 📘 React Checklist Project — Episode 1 Companion Guide

🎥 Watch Episode 1:

[![Episode 1 Thumbnail](https://img.youtube.com/vi/X3SXMCZ4sYE/hqdefault.jpg)](https://youtu.be/X3SXMCZ4sYE "Watch Episode 1 on YouTube")

Welcome to the first step in our React journey! This written guide follows along with the video tutorial and gives you extra explanations, code snippets, and useful reference links so you can dig deeper when you’re ready.

---

## 🏁 What We’re Building

We’re creating a **checklist app in React**. In this episode, we:

* Set up a React component
* Add some static data
* Use JSX to display that data
* Render a list with checkboxes
* Mount our app in the browser

By the end, you’ll have a working static checklist.

---

## Setup Script
2. **Travel to the right drive.**
   Type the following and press Enter:

   ```
   cd f:
   ```

   *(If your instructor tells you a different drive letter, use that instead!)*

3. **Run the React Project setup script.**

   **Copy, paste, and run the following command in Git Bash:**
   ```bash
   curl -fsSL "https://raw.githubusercontent.com/herringvoices/teaching-projects/refs/heads/main/react/unit-1-todo/scripts/setup.sh" | bash
   ```
You'll be prompted to enter a name for your project directory. It can be anything you want, so long as it doesn't have any spaces. I'd recommend "todo-app".

## 1. Template Flyover

We start with an HTML file that already has all the scripts loaded:

* **React** (the library itself)
* **ReactDOM** (so React can render in the browser)
* **Babel** (so JSX works in the browser)
* **Bootstrap & Font Awesome** (just for styling)

👉 We’re not changing much in `index.html` yet. Just set the `<title>` to **Checklist** so your browser tab looks right.

📖 [MDN: `<script>` tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script)

📖 [Bootstrap Documentation](https://getbootstrap.com/docs/5.3/getting-started/introduction/)

---

## 2. Our First Component

All React UI lives inside **components**.

```js
const App = () => {
  return (
    <main className="container py-4">
      <h1 className="h3">Checklist</h1>
    </main>
  );
};
```

Key ideas:

* A component is just a **JavaScript function** that returns JSX.
* JSX looks like HTML, but it’s not. It compiles into React function calls.
* Components must start with a **capital letter** (`App`, not `app`).
* Use `className` instead of `class` because `class` is reserved in JavaScript.

📖 [React Components](https://react.dev/learn/your-first-component)

📖 [MDN: Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions)

---

## 3. Adding Data

Instead of writing UI by hand, let’s start with an array of items:

```js
const items = [
  { id: 1, text: 'Milk',  checked: false },
  { id: 2, text: 'Bread', checked: true  },
  { id: 3, text: 'Eggs',  checked: false }
];
```

Each item has:

* `id`: unique identifier (important for React keys)
* `text`: what to display
* `checked`: whether the box is ticked

📖 [MDN: Arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

---

## 4. Embedding JavaScript in JSX

Curly braces `{}` let us drop JavaScript into JSX.

Example:

```js
<p className="text-muted">Items: {items.length}</p>
```

That shows the number of items in the array.

📖 [JSX Syntax](https://react.dev/learn/writing-markup-with-jsx)

---

## 5. Rendering the List with `map`

To loop over the array and make `<li>`s, use `.map()`:

```js
<ul className="list-group">
  {items.map(item => {
    return (
      <li key={item.id} className="list-group-item">
        <label className="form-check d-flex align-items-center gap-2 m-0">
          <input
            className="form-check-input"
            type="checkbox"
            checked={item.checked}
            readOnly
          />
          <span>{item.text}</span>
        </label>
      </li>
    );
  })}
</ul>
```

Notes:

* Every list item needs a **`key`** prop. Use `id`, not array index.
* `checked={item.checked}` uses JavaScript, not a string.
* `readOnly` is there so React doesn’t complain until we add change handlers later.
* Self-closing tags (`<input />`) are required in JSX.

📖 [MDN: Array.prototype.map()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)

📖 [React Lists & Keys](https://react.dev/learn/rendering-lists)

---

## 6. Mounting the App

Tell React where to put this component in the DOM:

```js
ReactDOM.render(<App />, document.getElementById('app'));
```

This means: render `<App />` into the element with `id="app"` inside `index.html`.

📖 [ReactDOM.render()](https://react.dev/reference/react-dom/render)

📖 [MDN: Document.getElementById()](https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementById)

---

## 🎯 Wrap-Up

At this point you:

* Built a simple React component
* Learned JSX basics (`className`, curly braces, self-closing tags)
* Rendered a list dynamically from data
* Mounted your app into the DOM

Next time, we’ll introduce **state** with `useState` so the app can actually respond when you add or check items.

📖 [React useState Hook](https://react.dev/reference/react/useState)

---

➡️ [Next Chapter: React Intro Chapter 2](react-intro-chapter-2.md)

✅ You now have a static checklist app. Great job!
