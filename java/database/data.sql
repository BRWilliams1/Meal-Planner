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

INSERT INTO households(user_id, household_name) VALUES (1, 'Alice');
INSERT INTO households(user_id, household_name) VALUES (2, 'Bob');
INSERT INTO households(user_id, household_name) VALUES (1, 'Charles');
INSERT INTO households(user_id, household_name) VALUES (1, 'Andy');


INSERT INTO recipes(recipe_name, instruction) VALUES ('pizza', 'Prepare crust, add sauce, select toppings, bake');
INSERT INTO recipes(recipe_name, instruction) VALUES ('pasta', 'cook pasta, add sauce, add mushroom, saute for 5 mins');
INSERT INTO recipes(recipe_name, instruction) VALUES ('Burger', '2 buns, add meat, add cheese');
INSERT INTO recipes(recipe_name, instruction) VALUES ('taco', 'tortilla, add chicken, add cheese');
INSERT INTO recipes(recipe_name, instruction) VALUES ('grilled chicken', 'mix herbs, oil, salt, bake');
INSERT INTO recipes(recipe_name, instruction) VALUES ('soup', 'cook tomato, add seasoning');
INSERT INTO recipes(recipe_name, instruction) VALUES ('chicken salad', 'chicken, lettuce, onion');

INSERT INTO  household_recipes(household_id, recipe_id) VALUES (1, 2);
INSERT INTO  household_recipes(household_id, recipe_id) VALUES (1, 4);
INSERT INTO  household_recipes(household_id, recipe_id) VALUES (2, 3);
INSERT INTO  household_recipes(household_id, recipe_id) VALUES (2, 5);

COMMIT TRANSACTION;
