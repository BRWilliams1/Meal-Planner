BEGIN TRANSACTION;

INSERT INTO households(household_name, household_owner) VALUES ('Admin Home', 'user');
INSERT INTO households(household_name, household_owner) VALUES ('home2', 'admin');
INSERT INTO households(household_name, household_owner) VALUES ('Charles Home', 'user');
INSERT INTO households(household_name, household_owner) VALUES ('Anita Home', 'user');
INSERT INTO households(household_name, household_owner) VALUES ('Antonella Home', 'user');
INSERT INTO households(household_name, household_owner) VALUES ('Brett Home', 'user');
INSERT INTO households(household_name, household_owner) VALUES ('Mohamed Home', 'user');


INSERT INTO users (username,password_hash,role, household_id) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 1);
INSERT INTO users (username,password_hash,role, household_id) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 1);
INSERT INTO users (username,password_hash,role, household_id) VALUES ('Charles','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 2);
INSERT INTO users (username,password_hash,role, household_id) VALUES ('Anita','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 3);
INSERT INTO users (username,password_hash,role, household_id) VALUES ('Antonella','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 4);
INSERT INTO users (username,password_hash,role, household_id) VALUES ('Brett','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 5);
INSERT INTO users (username,password_hash,role, household_id) VALUES ('Mohamed','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 6);


INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('Meal', 'description', 'ingredients', 'instructions', '');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('PIZZA', 'Dish of Italian origin consisting of bread dough topped with some combination of cheese and toppings', 'cheese, sauce, crust, veggies, meats', 'bake in oven for a set time', 'user');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('PASTA', 'Italian descent, typically made from a dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes, then cooked by boiling or baking', 'cheese, sauce, noodles, veggies, meats', 'boil in water until ready', 'user');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('BURGER', 'A patty of ground beef grilled and placed between two halves of a bun', 'cheese, lettuce, tomato, bun, meat', 'prepare toppings and sauces, grill meat, warm up buns, and combine all', 'user');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('TACO', 'Mexican food that consists of a folded and usually fried piece of thin bread (called a tortilla) that is filled with meat, cheese, lettuce, etc', 'cheese, lettuce, tomato, meat, tortilla', 'prepare toppings, cook your meat of choice, warm up tortilla and build your taco', 'user');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('GRILLED CHICKEN', 'A piece of grilled chicken you can serve with other dishes', 'chicken, herbs, butter', 'bake chicken in oven at a set temperature', 'admin');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('SOUP', 'A liquid food with a meat, fish, or vegetable stock as a base and often containing pieces of solid food', 'tomato, chicken, herbs, biscuits', 'prepare herbs and vegetables, cook protein, add broth', 'admin');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('CHICKEN SALAD', 'Healthy meal with combines a salad with your choice of chicken', 'tomato, chicken, onions, dressing, cheese', 'prepare chicken, pick toppings and sauces and combine', 'admin');

INSERT INTO meal_plan(household_id, meal_plan_name) VALUES (2, 'Charles Meal Plan');
INSERT INTO meal_plan(household_id, meal_plan_name) VALUES (3, 'Anita Meal Plan');
INSERT INTO meal_plan(household_id, meal_plan_name) VALUES (4, 'Antonella Meal Plan');
INSERT INTO meal_plan(household_id, meal_plan_name) VALUES (5, 'Brett Meal Plan');
INSERT INTO meal_plan(household_id, meal_plan_name) VALUES (6, 'Mohamed Meal Plan 4');

INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (1, '1/2/24', 3);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (2, '1/4/24', 2);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (3, '1/5/24', 4);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (4, '1/6/24', 2);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (5, '1/7/24', 3);


COMMIT TRANSACTION;
