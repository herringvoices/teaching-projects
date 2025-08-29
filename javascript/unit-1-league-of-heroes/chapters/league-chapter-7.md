# **League of (Somewhat) Super Heroes: Chapter 7**

## **Assign a City: Dropdowns & Connecting Data**

*Every hero needs a city to protect. In this chapter, you’ll practice building a dropdown menu from an array of city data, and display those options in your hero registration form. This is your first step toward connecting your data and making your app truly dynamic!*

---

### **Learning Objectives & Competencies**

By the end of this chapter, you should be able to:

* Use an array of objects to generate dynamic HTML (for a dropdown menu)
* Set up a `<select>` element in your form
* Give each option a value from your data (not just hard-code)
* Understand how arrays and the DOM work together

---

## **Step 1: Meet Your Cities**

Here’s an array of cities for your heroes to defend!
Each city is an object with an `id` and a `name`.

Add this to the *top* of your `main.js`:

```js
const cities = [
    { id: 1, name: "Metroville" },
    { id: 2, name: "Gotham Heights" },
    { id: 3, name: "Starbridge City" },
    { id: 4, name: "Ocean Point" }
];
```

---

## **Step 2: Add a Dropdown to Your HTML**

Add this to your form, right after your superpower input:

```html
<label for="citySelect" style="margin-left:1em;">City to Defend:</label>
<select id="citySelect"></select>
```

> 🧹 Cleanup Callout: Delete any hard-coded `<option>` tags you may have added earlier. The dropdown must be built dynamically from the `cities` array in the next step.

---

## **Step 3: Generate the Dropdown Options in JavaScript**

You’re going to use your `cities` array to *build* the `<option>` tags as a string, then set it as the innerHTML of your select.

Add this to your `main.js` (after your cities array, and after you’ve grabbed a reference to your select element):

```js
const citySelect = document.getElementById('citySelect');

// Build the options string using a for...of loop
let optionsHtml = "";
for (const city of cities) {
    optionsHtml += `<option value="${city.id}">${city.name}</option>`;
}
citySelect.innerHTML = optionsHtml;
```

> 🧹 Cleanup Callout: Ensure there’s only one `const citySelect = document.getElementById('citySelect');` at the top of your file. Remove duplicates further down.

**What’s going on here?**

* You loop through each city in your array.
* For each city, you add an `<option>` tag with:

  * The city’s `id` as the value (so you can use it later in your data)
  * The city’s `name` as the visible label

---

## **Step 4: Try It Out**

* Save and refresh.
* You should see a dropdown menu in your form listing every city from the array.
* If you add a new city to your array, it should show up in the dropdown the next time you reload!

---

## **Let’s Break Down That Loop:**

```js
for (const city of cities) {
    optionsHtml += `<option value="${city.id}">${city.name}</option>`;
}
```

* `for (const city of cities)` means “do this for each city in the cities array.”
* `city` is a variable that, each time through, represents the *current* city object.
* `city.id` is the unique ID, used as the option’s value (behind the scenes).
* `city.name` is what the user sees in the dropdown.

---

## **Why Are We Doing This?**

* Dynamic dropdowns mean your form updates whenever your data does. No need to hard-code options—let your code build them!
* Storing the city’s ID as the option value makes it easy to link your hero to their city in the future (coming up next chapter!).

---

## **Recap**

* You generated HTML for a dropdown menu using data from an array of objects.
* You used `for...of` and string building to connect your data with your form.
* You now have a dynamic way for heroes to pick which city to defend.

---

**Next up:** You’ll connect that city to the hero’s data when they join, and learn how to handle different data types using `parseInt`!
---
[← Previous Chapter](./league-chapter-6.md) | [Next Chapter →](./league-chapter-8.md)
