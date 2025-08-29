# 📘 React Checklist Project — Episode 3 Companion Guide

🎥 Watch Episode 3:

[![Episode 3 Thumbnail](https://img.youtube.com/vi/d9JGtaKrG6Q/hqdefault.jpg)](https://youtu.be/d9JGtaKrG6Q "Watch Episode 3 on YouTube")

---

## 🏁 What We’re Building

So far, our `App.js` has been doing all the heavy lifting. In this chapter, we’ll **refactor** by moving one row of our list into its own component called `ListItem`. This will make the code easier to read, maintain, and reuse. Along the way, you’ll learn about **props** and why they’re central to React.

By the end, you’ll:

* Understand what props are and how they work
* Extract a component into its own file
* Pass data and functions down from parent to child
* Keep behavior working the same way, but with cleaner code

---

## 1. Why Split into Components?

When one file does everything, it gets messy fast. Splitting into smaller components helps because:

* Each file has one clear purpose
* Reusability (you can use the same component in different places)
* Readability and easier debugging

📖 [React Components](https://react.dev/learn/your-first-component)

---

## 2. Identify What the Row Needs

Look at our current `<li>`:

* Uses `item.text` (to show the label)
* Uses `item.checked` (for the checkbox)
* Calls `handleToggle(item.id)` (to flip checked state)

That’s the “shopping list” of props our `ListItem` component will need.

📖 [React Props](https://react.dev/learn/passing-props-to-a-component)

---

## 3. Replace `<li>` with `<ListItem />`

In `App.js`, swap the inline row for a component:

```jsx
<ListItem
  key={item.id}
  item={item}
  handleToggle={handleToggle}
/>
```

Note: The `key` still belongs here because we’re inside `.map()`.

---

## 4. Create `ListItem.js`

Make a new file next to `App.js`:

```js
const ListItem = ({ item, handleToggle }) => {
  return (
    <li className="list-group-item">
      <label className="form-check d-flex align-items-center gap-2 m-0">
        <input
          className="form-check-input"
          type="checkbox"
          checked={item.checked}
          onChange={() => handleToggle(item.id)}
        />
        <span>{item.text}</span>
      </label>
    </li>
  );
};
```

We used **destructuring** in the parameter list so it’s clear what props this component expects.

📖 [MDN: Destructuring assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)

---

## 5. Load `ListItem.js` Before `App.js`

Since we’re using CDN + Babel, add a script tag in `index.html`:

```html
<script type="text/babel" src="./ListItem.js"></script>
<script type="text/babel" src="./App.js"></script>
```

Order matters — the child must be defined before the parent uses it.

📖 [MDN: `<script>` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script)

---

## 🎯 Wrap-Up

In this chapter, you:

* Broke out the list row into its own component
* Passed props from parent to child
* Made your code cleaner and more modular

Next time, we’ll introduce **useEffect** to handle side effects like saving and loading data.

---

⬅️ [Previous Chapter: React Intro Chapter 2](react-intro-chapter-2.md)
➡️ [Next Chapter: React Intro Chapter 4](react-intro-chapter-4.md)
