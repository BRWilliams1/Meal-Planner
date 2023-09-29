BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO meals_list(meals, ingredients) VALUES ('PIZZA', 'cheese, sauce, crust, veggies, meats');
INSERT INTO meals_list(meals, ingredients) VALUES ('PASTA', 'cheese, sauce, noodles, veggies, meats');
INSERT INTO meals_list(meals, ingredients) VALUES ('BURGER', 'cheese, lettuce, tomato, bun, meat');
INSERT INTO meals_list(meals, ingredients) VALUES ('TACO', 'cheese, lettuce, tomato, meat, tortilla');
INSERT INTO meals_list(meals, ingredients) VALUES ('GRILLED CHICKEN', 'chicken, herbs, butter');
INSERT INTO meals_list(meals, ingredients) VALUES ('SOUP', 'tomato, chicken, herbs, biscuits');
INSERT INTO meals_list(meals, ingredients) VALUES ('CHICKEN SALAD', 'tomato, chicken, onions, dressing, cheese');

INSERT INTO households(household_name) VALUES ('home1');
INSERT INTO households(household_name) VALUES ('home2');
INSERT INTO households(household_name) VALUES ('home2');
INSERT INTO households(household_name) VALUES ('home1');

INSERT INTO user_households(user_id, household_id) VALUES (2, 2);
INSERT INTO user_households(user_id, household_id) VALUES (1, 1);
INSERT INTO user_households(user_id, household_id) VALUES (1, 2);
INSERT INTO user_households(user_id, household_id) VALUES (2, 1);



--INSERT INTO recipes(recipe_name, instructions) VALUES ('PIZZA', 'cook');
--INSERT INTO recipes(recipe_name, instructions) VALUES ('PASTA', 'cook');
--INSERT INTO recipes(recipe_name, instructions) VALUES ('BURGER', 'cook');
--INSERT INTO recipes(recipe_name, instructions) VALUES ('TACO', 'cook');
--INSERT INTO recipes(recipe_name, instructions) VALUES ('GRILLED CHICKEN', 'cook');
--INSERT INTO recipes(recipe_name, instructions) VALUES ('SOUP', 'cook');
--INSERT INTO recipes(recipe_name, instructions) VALUES ('CHICKEN SALAD', 'cook');

--INSERT INTO ingredients(ingredient_name) VALUES ('tomato');
--INSERT INTO ingredients(ingredient_name) VALUES ('cheese');
--INSERT INTO ingredients(ingredient_name) VALUES ('chicken');
--INSERT INTO ingredients(ingredient_name) VALUES ('lettuce');
--INSERT INTO ingredients(ingredient_name) VALUES ('veggies');
--INSERT INTO ingredients(ingredient_name) VALUES ('sauce');
--INSERT INTO ingredients(ingredient_name) VALUES ('herbs');
--
--INSERT INTO measurement_units(measurement_type) VALUES ('tsp.');
--INSERT INTO measurement_units(measurement_type) VALUES ('Tbsp.');
--INSERT INTO measurement_units(measurement_type) VALUES ('cup');
--INSERT INTO measurement_units(measurement_type) VALUES ('qt.');
--INSERT INTO measurement_units(measurement_type) VALUES ('ml');
--INSERT INTO measurement_units(measurement_type) VALUES ('L');
--INSERT INTO measurement_units(measurement_type) VALUES ('fl. oz.');
--INSERT INTO measurement_units(measurement_type) VALUES ('unit');

INSERT INTO households_meals(household_id, meals_id) VALUES (1, 3);
INSERT INTO households_meals(household_id, meals_id) VALUES (1, 2);
INSERT INTO households_meals(household_id, meals_id) VALUES (2, 6);
INSERT INTO households_meals(household_id, meals_id) VALUES (2, 4);

--INSERT INTO recipes_ingredients(recipe_id, ingredient_id, measurement_id, qty) VALUES (1, 3, 4, 1);
--INSERT INTO recipes_ingredients(recipe_id, ingredient_id, measurement_id, qty) VALUES (1, 2, 3, 2);
--INSERT INTO recipes_ingredients(recipe_id, ingredient_id, measurement_id, qty) VALUES (2, 6, 1, 5);
--INSERT INTO recipes_ingredients(recipe_id, ingredient_id, measurement_id, qty) VALUES (2, 4, 3, 3);
--
--INSERT INTO grocery_list(household_id, ingredient_id) VALUES (1, 3);
--INSERT INTO grocery_list(household_id, ingredient_id) VALUES (1, 2);
--INSERT INTO grocery_list(household_id, ingredient_id) VALUES (2, 6);
--INSERT INTO grocery_list(household_id, ingredient_id) VALUES (2, 4);

INSERT INTO meal_plan(planner_date, meals_name, household_id) VALUES ('1/3/24', 'Pizza', 3);
INSERT INTO meal_plan(planner_date, meals_name, household_id) VALUES ('1/4/24','Pasta', 2);
INSERT INTO meal_plan(planner_date, meals_name, household_id) VALUES ('1/5/24', 'Taco', 1);
INSERT INTO meal_plan(planner_date, meals_name, household_id) VALUES ('1/6/24','Burger', 3);


COMMIT TRANSACTION;