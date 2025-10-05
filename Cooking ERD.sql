DROP DATABASE IF EXISTS CookingDB;
CREATE DATABASE IF NOT EXISTS CookingDB;
USE CookingDB;
-- Users table
CREATE TABLE Users (
 user_id INT PRIMARY KEY AUTO_INCREMENT,
 user_name VARCHAR(100) NOT NULL,
 email VARCHAR(100) UNIQUE NOT NULL,
 preferences VARCHAR(50)
);
-- Recipes table
CREATE TABLE Recipes (
 recipe_id INT PRIMARY KEY AUTO_INCREMENT,
 recipe_name VARCHAR(150) NOT NULL,
 description TEXT,
 cooking_time INT,
 difficulty_level VARCHAR(50),
 user_id INT,
 FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- Ingredients table
CREATE TABLE Ingredients (
 ingredient_id INT PRIMARY KEY AUTO_INCREMENT,
 ingredient_name VARCHAR(100) NOT NULL,
 quantity_type VARCHAR(50)
);
-- Junction table
CREATE TABLE Recipe_Ingredients (
 recipe_id INT,
 ingredient_id INT,
 quantity VARCHAR(50),
 PRIMARY KEY (recipe_id, ingredient_id),
 FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
 FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);
-- Steps table
CREATE TABLE Cooking_Steps (
 step_id INT PRIMARY KEY AUTO_INCREMENT,
 recipe_id INT,
 step_number INT,
 instruction TEXT,
 FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id)
);
-------------------------------------------------
-- INSERT SAMPLE DATA
-------------------------------------------------
-- Users (5 records)
INSERT INTO Users (user_name, email, preferences) VALUES
('Diya', 'diya@email.com', 'Vegetarian'),
('Alex', 'alex@email.com', 'Non-Veg'),
('Priya', 'priya@email.com', 'Vegan'),
('John', 'john@email.com', 'Non-Veg'),
('Sara', 'sara@email.com', 'Vegetarian');
-- Recipes (5 records)
INSERT INTO Recipes (recipe_name, description, cooking_time, difficulty_level, 
user_id) VALUES
('Pasta', 'Italian dish with sauce', 20, 'Easy', 1),
('Paneer Curry', 'Indian spicy curry', 40, 'Medium', 1),
('Salad Bowl', 'Fresh vegetable salad', 15, 'Easy', 3),
('Chicken Biryani', 'Spicy rice with chicken', 60, 'Hard', 2),
('Vegetable Soup', 'Healthy mixed vegetable soup', 30, 'Easy', 5);
-- Ingredients (10 records)
INSERT INTO Ingredients (ingredient_name, quantity_type) VALUES
('Tomato', 'grams'),
('Onion', 'grams'),
('Pasta', 'grams'),
('Paneer', 'grams'),
('Chicken', 'grams'),
('Rice', 'grams'),
('Carrot', 'grams'),
('Cucumber', 'grams'),
('Spinach', 'grams'),
('Potato', 'grams');
-- Recipe_Ingredients (15 records)
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(1, 1, '200g'),
(1, 2, '100g'),
(1, 3, '150g'),
(2, 2, '150g'),
(2, 4, '200g'),
(3, 1, '50g'),
(3, 7, '50g'),
(3, 8, '50g'),
(4, 2, '200g'),
(4, 5, '300g'),
(4, 6, '250g'),
(5, 1, '100g'),
(5, 7, '100g'),
(5, 9, '100g'),
(5, 10, '100g');
-- Cooking Steps (15 records)
INSERT INTO Cooking_Steps (recipe_id, step_number, instruction) VALUES
(1, 1, 'Boil pasta'),
(1, 2, 'Prepare tomato sauce'),
(1, 3, 'Mix pasta and sauce'),
(2, 1, 'Fry onions'),
(2, 2, 'Add paneer and spices'),
(3, 1, 'Chop vegetables'),
(3, 2, 'Mix vegetables in bowl'),
(3, 3, 'Add dressing'),
(4, 1, 'Marinate chicken'),
(4, 2, 'Cook rice and spices'),
(4, 3, 'Mix chicken with rice'),
(5, 1, 'Chop vegetables'),
(5, 2, 'Boil vegetables in water'),
(5, 3, 'Add spices and simmer');
-------------------------------------------------
SELECT * FROM RECIPES;

UPDATE USERS
SET PREFERENCES = "NON-VEG"
WHERE USER_ID = 1;

DELETE FROM COOKING_STEPS
WHERE STEP_ID = 5;
