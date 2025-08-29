> 🧹 Cleanup Callout (from Chapter 1): Before continuing, delete your temporary test lines so there’s only one source of truth.
>
> Remove these lines from `main.js`:
>
> ```js
> const heroGreeting = welcomeHero("Athena Thunderpunch");
> console.log(heroGreeting);
> ```
>
> Keep the `welcomeHero(heroName)` function and your DOM references only.

## **Step 2: Connect Your HTML Elements to JavaScript**

Before we can use JavaScript to make our page interactive, we need to tell our script which parts of the page we want to control.

### **What is this step really doing?**

Every HTML element (like your input, button, and div) can be given an **ID**—a unique name so you (and JavaScript) can find it easily.
In JavaScript, we use a special tool called `document.getElementById("someId")` to grab hold of these elements. Once you have that “reference,” you can read or change what’s inside them.

---

Add these lines at the **very top** of your `main.js` (above your function):

```js
// These lines "grab" our HTML elements and let us use them in our code:
const heroNameInput = document.getElementById('heroNameInput'); // The text box for hero names
const joinButton = document.getElementById('joinButton'); // The Join League button
const welcomeMessageDiv = document.getElementById('welcomeMessageDiv'); // Where the message will show up
```

**What did you just do?**

* You created variables that point directly to your input box, your button, and the message area.
* Now, whenever you want to get the hero’s name, you can use `heroNameInput.value`.
* When you want to change the message on the page, you can set `welcomeMessageDiv.textContent`.

*Think of this as picking your team for dodgeball. You’ve just called out each element by name so you can use them in the game.*

---

## **Step 4: Make the Button “Listen” For Clicks**

**Why do this?**

* When someone clicks the "Join League" button, you want something to happen (not just sit there sulking like Aquaman at a fish fry).
* You do this by giving the button an **event handler**—a function that says, “When you get clicked, run this code!”

---

Add this code **after** your `welcomeHero` function:

```js
// This tells the button: "When you get clicked, run the following code."
joinButton.onclick = () => {
    // 1. Get the value from the input box
    const name = heroNameInput.value;

    // 2. Make the welcome message using your function
    const message = welcomeHero(name);

    // 3. Put that message into the message div on the page
    welcomeMessageDiv.textContent = message;
};
```

### **Here’s what’s happening, step by step:**

1. **Get what the user typed in:**
   `heroNameInput.value` pulls whatever name was entered in the input box.
2. **Generate the welcome message:**
   `welcomeHero(name)` takes the input and creates a string with their name.
3. **Display it on the page:**
   `welcomeMessageDiv.textContent = message;` updates the div so everyone can see the message (not just you in the console).

*It’s like a superhero call-and-response: The button gets clicked (“Help!”), your function springs into action (“Welcome, hero!”), and the league grows stronger.*

---

### **In Summary**

You’re not just copying code. You’re giving your JavaScript the tools it needs to talk to the web page, and you’re telling your button to listen for a signal (“click!”) and respond by welcoming a new hero.

---

[← Previous Chapter](./league-chapter-1.md) | [Next Chapter →](./league-chapter-3.md)
