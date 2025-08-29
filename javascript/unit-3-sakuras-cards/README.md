# Sakura's Cards

## Unit 3: Data Modeling, DOM Events, and UI State

Welcome to **Sakura's Cards**!

In this project you’ll help **Sakura Mutou** modernize her growing trading card shop network. You’ll start by understanding simple data structures, then evolve them into richer relationships (one‑to‑many and many‑to‑many). Along the way you’ll render data to the DOM, respond to user interaction (clicks & dropdown changes), and manage a tiny bit of UI state to keep everything in sync.

---

### **What You'll Learn**

- Reading and interpreting existing starter code
- Entity Relationship Diagrams (ERDs) for planning data
- One‑to‑many vs many‑to‑many relationships
- Join tables and why they exist
- Using getters to access in‑memory "database" data
- DOM rendering with template strings
- Array methods: `.map()` for transforming, `.filter()` for narrowing
- Adding hidden metadata with `data-` attributes
- Global (module‑level) state for simple UI selections
- Event handling: `click` (event delegation) & `change`
- Using `.dataset`, `event.target.value`, and `parseInt`
- Conditional rendering & incremental refactors
- Re-rendering portions of the DOM (`innerHTML` vs `outerHTML`)

---

## **Table of Contents**

| Chapter | Topic |
|---------|-------|
| 1 | [The Stores](./chapters/sakuras-cards-chapter-1.md) |
| 2 | [Showing the Packs](./chapters/sakuras-cards-chapter-2.md) |
| 3 | [Clicking on Packs](./chapters/sakuras-cards-chapter-3.md) |
| 4 | [Evolving the Data — Many-to-Many with Stores](./chapters/sakuras-cards-chapter-4.md) |
| 5 | [Add a Store Dropdown](./chapters/sakuras-cards-chapter-5.md) |
| 6 | [Filter Packs by Store (and Show Quantities)](./chapters/sakuras-cards-chapter-6.md) |

---

## **How to Use This Project**

Start with [Chapter 1](./chapters/sakuras-cards-chapter-1.md). Each chapter builds directly on the previous one—don’t skip ahead.

General flow:
1. Read the narrative & objectives.
2. Follow the setup or step instructions in order.
3. Try the task before peeking at any reveal/example blocks.
4. Test in the browser / console as you go.
5. Commit small, frequent changes (if you’ve initialized a repo separately).

Navigation: Use the "Next Chapter" / "Previous Chapter" links (when present) at the bottom of each chapter, or return here to jump around.

---

### **Pacing Advice**

Expect this unit to take **about one week** (possibly spilling into a second) alongside your regular PCC coursework. Chapters 1–3 focus on foundation and DOM interaction; Chapters 4–6 layer on data modeling complexity and stateful rendering. Don’t rush the ERD and join table concepts—they unlock a lot of future coursework.

---

### **Tips for Success**

- Draw (or redraw) the ERD whenever the data changes.
- Say out loud what each array method returns before you code it.
- Log intermediate values (arrays & objects) early and remove logs later.
- Keep functions small: one purpose, clear return.
- Re-run the page after every meaningful edit—tight feedback loops.

---

**Questions? Stuck?**

Ask your instructor or TA, pair with a classmate, or carefully re-read the previous chapter. Remember: every rendering glitch or undefined value is a clue. Trace it calmly and you’ll strengthen both your debugging and mental model.

Good luck—time to make Sakura’s inventory come alive!

---
