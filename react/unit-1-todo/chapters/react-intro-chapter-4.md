# 📘 React Checklist Project — Episode 4 Companion Guide

🎥 Watch Episode 4:

[![Episode 4 Thumbnail](https://img.youtube.com/vi/Q-uI2pE21BY/hqdefault.jpg)](https://youtu.be/Q-uI2pE21BY "Watch Episode 4 on YouTube")

---

## 🏁 What We’re Building

Our checklist now has components and state, but it still forgets everything when the page refreshes. In this chapter, we’ll introduce a new React hook: **`useEffect`**. We’ll use it to:

* Cross off items visually when checked
* Split the list into Active and Crossed-Off sections
* Save to and load from `localStorage` so the list persists across refreshes

By the end, you’ll understand when to use `useEffect` and how to keep your app’s state in sync with the outside world.

---

## 1. What is `useEffect`?

* Code that runs **after React renders the page**
* Code that runs **when specific state changes**

## 2. When to use `useEffect`?

1. **When you want something to run only once**
   React re-renders every time state changes, and re-runs all the code too! But sometimes you only want something to run once, such as when you:

* Fetch data from a database
* Set up an event listener (like pressing Esc to close a modal)
* Load saved data from localStorage

2. **When you want code to run every time a specific piece of state or a prop changes**
   Sometimes you want to listen for when state or props change and do something when they do. Like a change listener, but for state! Some examples are:

* A user types in a search bar and you update the results as they type
* A dropdown changes and prompts a change in what’s displayed
* A user clicks a “dark mode” button and the site’s color scheme changes

📖 [React useEffect Hook](https://react.dev/reference/react/useEffect)

---

## 2. Cross-Off Styling

Update `ListItem.js` so completed items look different:

```jsx
<span className={item.checked ? "text-decoration-line-through text-muted" : ""}>
  {item.text}
</span>
```

We’re using a **ternary operator**: `condition ? valueIfTrue : valueIfFalse`.

📖 [MDN: Conditional (ternary) operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Conditional_operator)

---

## 3. Splitting Into Active vs Crossed-Off

Instead of keeping everything in one list, filter the items:

```js
const activeItems = items.filter(item => !item.checked);
const crossedOff = items.filter(item => item.checked);
```

This creates two derived arrays directly from `items`.

📖 [MDN: Array.prototype.filter()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)

Render them separately:

```jsx
<h2>Active Items</h2>
<ul className="list-group">
  {activeItems.map(item => (
    <ListItem key={item.id} item={item} handleToggle={handleToggle} />
  ))}
</ul>

<h2 className="mt-4">Crossed Off</h2>
<ul className="list-group">
  {crossedOff.map(item => (
    <ListItem key={item.id} item={item} handleToggle={handleToggle} />
  ))}
</ul>
```

---

## 4. Loading From localStorage

When the app starts, load any saved items:

```js
useEffect(() => {
  try {
    const raw = localStorage.getItem('checklist-items-v1');
    if (!raw) return;
    const saved = JSON.parse(raw);
    if (Array.isArray(saved)) {
      setItems(saved);
    }
  } catch (err) {
    console.error('Failed to load items:', err);
  }
}, []);
```

* Runs once on mount (`[]`)
* Reads from `localStorage`
* Parses JSON safely with try/catch

📖 [MDN: localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)

---

## 5. Saving to localStorage

Whenever `items` changes, save it:

```js
useEffect(() => {
  try {
    const json = JSON.stringify(items);
    localStorage.setItem('checklist-items-v1', json);
  } catch (err) {
    console.error('Failed to save items:', err);
  }
}, [items]);
```

* Runs every time `items` updates
* Converts the array to JSON and saves under the same key

📖 [MDN: JSON.stringify](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify)

---

## 🎯 Wrap-Up

In this chapter, you:

* Used a ternary operator for conditional classes
* Split items into Active and Crossed-Off sections
* Learned what `useEffect` is really for
* Saved and loaded data from `localStorage`

Next time, we’ll add a **Delete button** and a global keyboard shortcut (`U` to uncheck all) using `useEffect` cleanup.

---

⬅️ [Previous Chapter: React Intro Chapter 3](react-intro-chapter-3.md)
➡️ [Next Chapter: React Intro Chapter 5](react-intro-chapter-5.md)
