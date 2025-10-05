# 🍳 CookingDB – ER Diagram Project

![CookingDB Banner](ERD.png)

## 📖 Overview
**CookingDB** is a structured SQL database project designed to efficiently manage recipes, ingredients, users, and step-by-step cooking processes.  
It demonstrates database normalization, relational modeling, and SQL query implementation for real-world recipe management systems.

---

## 🗂️ Repository Structure

---

## 🧱 Database Entities
| Table | Description | Primary Key | Foreign Key |
|-------|--------------|--------------|--------------|
| **Users** | Stores user info & preferences | user_id | — |
| **Recipes** | Contains recipe details | recipe_id | user_id → Users.user_id |
| **Ingredients** | List of ingredients | ingredient_id | — |
| **Recipe_Ingredients** | Bridge table for many-to-many relation | — | recipe_id, ingredient_id |
| **Cooking_Steps** | Ordered recipe instructions | step_id | recipe_id → Recipes.recipe_id |

---

## 🔗 Key Relationships
- **Users → Recipes** → One-to-Many  
- **Recipes ↔ Ingredients** → Many-to-Many via `Recipe_Ingredients`  
- **Recipes → Cooking_Steps** → One-to-Many  

---

## 🧩 Example SQL Queries
```sql
-- 1️⃣ List all recipes
SELECT recipe_id, recipe_name, cooking_time, difficulty_level FROM Recipes;

-- 2️⃣ Ingredients used in each recipe
SELECT r.recipe_name, i.ingredient_name, ri.quantity, i.quantity_type
FROM Recipe_Ingredients ri
JOIN Recipes r ON ri.recipe_id = r.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id;

-- 3️⃣ Most used ingredients
SELECT i.ingredient_name, COUNT(*) AS usage_count
FROM Recipe_Ingredients ri
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id

---

Would you like me to make a **shorter LinkedIn caption** (2–3 lines) to upload this project post with your PPT?

GROUP BY i.ingredient_name
ORDER BY usage_count DESC;
