# 📘 React Checklist Project — Episode 2 Companion Guide

🎥 Watch Episode 2:

[![Episode 2 Thumbnail](https://img.youtube.com/vi/nxCs9Zt9If4/hqdefault.jpg)](https://youtu.be/nxCs9Zt9If4 "Watch Episode 2 on YouTube")

---

## 🏁 What We’re Building

In Episode 1, we built a static checklist using a plain JavaScript array. In this chapter, we’ll give our app a **memory** by using React state. We’ll also make the checklist interactive: you can add items, check them off, and see the UI respond.

By the end, you’ll:

* Understand what **state** is and why it matters
* Use the `useState` hook to store data
* Build a controlled input for adding new items
* Toggle checkboxes to update the UI

---

## 1. Why State?

Plain variables reset every time a component renders. **State** is React’s built‑in memory: it survives re‑renders and keeps your UI in sync with user actions.

📖 [React State: A Component’s Memory](https://react.dev/learn/state-a-components-memory)

---

## 2. Using `useState`

At the top of `App.js`, grab `useState` from React:

```js
const { useState } = React;
```

Then convert your `items` array into state:

```js
const [items, setItems] = useState([
  { id: 1, text: 'Milk',  checked: false },
  { id: 2, text: 'Bread', checked: true  },
  { id: 3, text: 'Eggs',  checked: false }
]);
```

* `items` is the current value
* `setItems` is the only way to update it

📖 [React `useState` Hook](https://react.dev/reference/react/useState)

---

## 3. Adding Input State

We need another piece of state to track the text the user types in:

```js
const [newText, setNewText] = useState('');
```

This will make our `<input>` a **controlled component**.

📖 [Controlled Components](https://react.dev/learn/sharing-state-between-components#controlled-and-uncontrolled-components)

---

## 4. Building the Input & Button

Create a form in JSX:

```jsx
<form className="d-flex gap-2 mb-3" onSubmit={handleAddItem}>
  <input
    className="form-control"
    placeholder="Add item..."
    value={newText}
    onChange={(e) => setNewText(e.target.value)}
  />
  <button className="btn btn-primary" type="submit">Add</button>
</form>
```

* `value={newText}` makes the input show what’s in state
* `onChange` updates state on each keystroke
* The button (or pressing Enter) will submit the form

📖 [MDN: `<input>` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)

---

## 5. Adding Items

Define `handleAddItem` above the return:

```js
function handleAddItem(event) {
  event.preventDefault();
  const text = newText.trim();
  if (!text) return;

  const newItem = { id: Date.now(), text, checked: false };
  setItems(prev => [...prev, newItem]);
  setNewText('');
}
```

* Prevents page reload
* Ignores empty strings
* Creates a new object with a unique id
* Uses the spread operator to create a new array
* Clears the input afterward

📖 [MDN: Spread syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)

---

## 6. Toggling Checkboxes

Add this function:

```js
function handleToggle(id) {
  setItems(prev => prev.map(item => {
    if (item.id === id) {
      return { ...item, checked: !item.checked };
    }
    return item;
  }));
}
```

Update the checkbox in your list render:

```jsx
<input
  className="form-check-input"
  type="checkbox"
  checked={item.checked}
  onChange={() => handleToggle(item.id)}
/>
```

Now the UI responds when you check or uncheck an item.

📖 [MDN: Array.prototype.map()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)

---

## 🎯 Wrap-Up

In this chapter, you:

* Learned what state is
* Built a controlled input
* Added new items to the list
* Toggled checkboxes interactively

Next time, we’ll refactor our code by creating a reusable **ListItem component**.

---

⬅️ [Previous Chapter: React Intro Chapter 1](react-intro-chapter-1.md)
➡️ [Next Chapter: React Intro Chapter 3](react-intro-chapter-3.md)
