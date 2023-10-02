BEGIN TRANSACTION;

INSERT INTO households(household_name, household_owner) VALUES ('Admin Home', 'user');
INSERT INTO households(household_name, household_owner) VALUES ('home2', 'admin');

INSERT INTO users (username,password_hash,role, household_id) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 1);
INSERT INTO users (username,password_hash,role, household_id) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 1);

INSERT INTO meals(meal_name, description, ingredients, instructions) VALUES ('PIZZA', 'food', 'cheese, sauce, crust, veggies, meats', 'cook');
INSERT INTO meals(meal_name, description, ingredients, instructions) VALUES ('PASTA', 'food', 'cheese, sauce, noodles, veggies, meats', 'cook');
INSERT INTO meals(meal_name, description, ingredients, instructions) VALUES ('BURGER', 'food', 'cheese, lettuce, tomato, bun, meat', 'cook');
INSERT INTO meals(meal_name, description, ingredients, instructions) VALUES ('TACO', 'food', 'cheese, lettuce, tomato, meat, tortilla', 'cook');
INSERT INTO meals(meal_name, description, ingredients, instructions) VALUES ('GRILLED CHICKEN', 'food', 'chicken, herbs, butter', 'cook');
INSERT INTO meals(meal_name, description, ingredients, instructions) VALUES ('SOUP', 'food', 'tomato, chicken, herbs, biscuits', 'cook');
INSERT INTO meals(meal_name, description, ingredients, instructions) VALUES ('CHICKEN SALAD', 'food', 'tomato, chicken, onions, dressing, cheese', 'cook');

INSERT INTO meal_plan(household_id) VALUES (1);
INSERT INTO meal_plan(household_id) VALUES (2);
INSERT INTO meal_plan(household_id) VALUES (2);
INSERT INTO meal_plan(household_id) VALUES (2);

INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (1, '1/3/24', 3);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (1, '1/4/24', 2);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (2, '1/5/24', 1);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (2, '1/6/24', 3);


COMMIT TRANSACTION;
