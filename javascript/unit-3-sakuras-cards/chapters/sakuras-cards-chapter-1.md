
# Chapter 1: The Stores

You’ve just been recruited by **Sakura Mutou**, who runs a growing chain of trading card game stores. She’s excited but overwhelmed—she wants a website that keeps track of her stores, the packs they sell, and the cards inside those packs. She’s turning to you to bring order to the chaos and help make her vision real.

By the end of this project, users should be able to:

* Select a store from a dropdown list.
* See which packs are available at that store.
* Click on a pack to reveal which cards might be inside.

We’re not there yet—but we’ll get there step by step. For now, you’ll start with the basics: understanding the data that powers the site.

---

## Learning Objectives

By the end of this chapter, you should be able to:

* Explain what an **Entity Relationship Diagram (ERD)** is and why it’s useful.
* Identify the key entities in the database you’ve been given.
* Draw a simple ERD on paper showing how those entities connect.

---

### Watch: ERD Introduction Video

Before you read the rest of this chapter, watch this short video overview of ERDs:

[▶️ ERD Introduction Video](https://youtu.be/R4GJ49d5ppQ)

[![ERD Introduction Video](https://img.youtube.com/vi/R4GJ49d5ppQ/0.jpg)](https://youtu.be/R4GJ49d5ppQ)



---

## Technical Vocabulary

| Term             | Definition                                                                        |
| ---------------- | --------------------------------------------------------------------------------- |
| Entity           | A thing we want to keep track of in our system (like `Store`, `Pack`, or `Card`). |
| Primary Key (PK) | A unique identifier for a record in a table (usually an `id`).                    |
| Foreign Key (FK) | A field in one table that points to a primary key in another table.               |
| Relationship     | The way two entities are connected (e.g., one pack contains many cards).          |

---

## Local Setup: Get the Starter Files Running

Before you can look at `database.js` in Step 1, make sure the starter files exist on your machine. They are created/downloaded by a setup script. These steps assume **Git Bash on Windows** and that you want the project on drive `F:` (change if needed).

1. Open **Git Bash**.
2. Switch to the `F:` drive:
	```bash
	cd f:
	```
3. Download the project setup script:
	```bash
   curl -fsSL "https://raw.githubusercontent.com/herringvoices/teaching-projects/refs/heads/main/javascript/unit-3-sakuras-cards/scripts/setup.sh" | bash
	```


4. Run the script (either form works):
	```bash
	bash setup.sh
	# or
	chmod +x setup.sh
	./setup.sh
	```
5. Move into the project folder:
	```bash
	cd sakuras-cards
	```
	(If that errors, run `ls` to confirm the folder name.)
6. Open in VS Code:
	```bash
	code .
	```

Once you see the files (including `database.js`) in VS Code, continue to Step 1.

---

## Step 1: Look at the Database

You’ve been given a `database.js` file. Inside, you’ll find arrays of objects that represent the different entities in this project:

* **packs**: the different pack products that can be sold.
* **cards**: the cards that belong to a specific pack.

Don’t worry about the extra properties for now. Just notice that some objects have fields that reference other entities. For example, a `card` might have a `packId`—that’s a foreign key pointing back to the pack it belongs to.

---

## Step 2: Draw the ERD

On paper, make two boxes labeled:

* **Packs**
* **Cards**

In each box, write the entity name, `id`, and any foreign keys.

For example, the `Cards` box should include:

* `id` (PK)
* `packId` (FK)

Now, connect the boxes with a line that shows:

* **One pack can have many cards**
* **Each card belongs to one pack**

That’s your first ERD!

---

## Step 3: Think About the Relationships

As you look at your diagram, notice:

* Each pack can contain many cards, but each card belongs to exactly one pack.
* This one-to-many relationship is the foundation for the work you’ll do in later chapters.

---

By the end of this project, this diagram will evolve as we add new requirements. For now, keep your paper copy handy—you’ll use it often as you build the site.

---

## Reflection

* You identified the initial entities (Packs, Cards) and their one‑to‑many relationship.
* You practiced reading foreign keys conceptually before writing any UI.
* A clear ERD now serves as a map for future features.

## Consistency Check

* `database.js` contains arrays for packs and cards.
* Each card object includes a `packId` referencing a pack `id`.
* Your paper ERD shows: Pack 1→many Card; Card many→1 Pack.
* You can explain PK vs FK in your own words.

---

## Navigation

[Next Chapter →](./sakuras-cards-chapter-2.md)
