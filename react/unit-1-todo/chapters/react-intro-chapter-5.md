# 📘 React Checklist Project — Episode 5 Companion Guide

🎥 Watch Episode 5:

[![Episode 5 Thumbnail](https://img.youtube.com/vi/6rNNa4TvonI/hqdefault.jpg)](https://youtu.be/6rNNa4TvonI "Watch Episode 5 on YouTube")

---

## 🏁 What We’re Building

Our checklist now saves and loads data, but we’re missing two important features:

1. A **Delete button** so users can remove items.
2. A **keyboard shortcut (pressing “U”)** to uncheck all items at once.

This chapter introduces passing down new props for actions and shows how to properly add and clean up event listeners with `useEffect`.

By the end, you’ll:

* Understand how to delete items immutably with `filter`
* Pass functions as props to child components
* Add a global keyboard listener with `useEffect`
* Use cleanup functions to prevent memory leaks

---

## 1. Handle Delete in Parent

Inside `App.js`, write a function to delete an item by id:

```js
function handleDelete(id) {
  setItems(prev => prev.filter(item => item.id !== id));
}
```

* `filter` returns a new array without the matching item
* No mutation — React always expects immutable updates

📖 [MDN: Array.prototype.filter()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)

---

## 2. Pass Delete Down as Prop

Update your list render to send the delete function to each `ListItem`:

```jsx
<ListItem
  key={item.id}
  item={item}
  handleToggle={handleToggle}
  handleDelete={handleDelete}
/>
```

Do this in both Active and Crossed-Off maps.

📖 [React Props](https://react.dev/learn/passing-props-to-a-component)

---

## 3. Add Delete Button in `ListItem`

In `ListItem.js`, accept the new prop:

```js
const ListItem = ({ item, handleToggle, handleDelete }) => {
```

Add a button inside the `<li>`:

```jsx
<button
  type="button"
  className="btn btn-sm btn-outline-secondary ms-auto"
  onClick={() => handleDelete(item.id)}
>
  <i className="fa fa-trash"></i>
</button>
```

* `type="button"` prevents accidental form submits
* `ms-auto` pushes the button to the right (Bootstrap class)
* The child calls `handleDelete`; the parent updates state

📖 [Bootstrap Buttons](https://getbootstrap.com/docs/5.3/components/buttons/)

---

## 4. Add Global “U” Shortcut

Use `useEffect` in `App.js` to listen for the `U` key:

```js
useEffect(() => {
  function onKeyDown(e) {
    const tag = document.activeElement?.tagName;
    if (tag === 'INPUT' || tag === 'TEXTAREA') return; // don’t hijack typing

    if (e.key && e.key.toLowerCase() === 'u') {
      setItems(prev => prev.map(it => ({ ...it, checked: false })));
    }
  }

  document.addEventListener('keydown', onKeyDown);
  return () => document.removeEventListener('keydown', onKeyDown);
}, []);
```

* Adds the event listener once when the component mounts
* Cleans it up when the component unmounts (best practice!)
* Respects inputs/textareas so we don’t break typing

📖 [MDN: Document.addEventListener()](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)

📖 [React useEffect Cleanup](https://react.dev/learn/synchronizing-with-effects#step-3-add-cleanup-if-needed)

---

## 🎯 Wrap-Up

In this chapter, you:

* Added a delete button with an immutable state update
* Passed functions as props to child components
* Added a global keyboard shortcut with `useEffect`
* Learned why cleanup functions are critical

This wraps up the core features of our checklist app! From here, you could add polish like focusing the input after adding an item or syncing with an API.

---

⬅️ [Previous Chapter: React Intro Chapter 4](react-intro-chapter-4.md)
