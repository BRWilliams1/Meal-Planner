BEGIN TRANSACTION;

INSERT INTO households(household_name, household_owner) VALUES ('Admin Home', 'user');
INSERT INTO households(household_name, household_owner) VALUES ('home2', 'admin');

INSERT INTO users (username,password_hash,role, household_id) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', 1);
INSERT INTO users (username,password_hash,role, household_id) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 1);

INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('PIZZA', 'food', 'cheese, sauce, crust, veggies, meats', 'cook', 'user');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('PASTA', 'food', 'cheese, sauce, noodles, veggies, meats', 'cook', 'user');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('BURGER', 'food', 'cheese, lettuce, tomato, bun, meat', 'cook', 'user');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('TACO', 'food', 'cheese, lettuce, tomato, meat, tortilla', 'cook', 'user');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('GRILLED CHICKEN', 'food', 'chicken, herbs, butter', 'cook', 'admin');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('SOUP', 'food', 'tomato, chicken, herbs, biscuits', 'cook', 'admin');
INSERT INTO meals(meal_name, description, ingredients, instructions, meal_owner) VALUES ('CHICKEN SALAD', 'food', 'tomato, chicken, onions, dressing, cheese', 'cook', 'admin');

INSERT INTO meal_plan(household_id, meal_name, planner_date, meal_plan_details) VALUES (1, 'FISH AND CHIPS', '1/23/23', 'Fried fish with chips served together' );
INSERT INTO meal_plan(household_id, meal_name, planner_date, meal_plan_details) VALUES (2, 'CHICKEN AND PASTA', '6/23/23', 'Chicken breast served with pasta' );
INSERT INTO meal_plan(household_id, meal_name, planner_date, meal_plan_details) VALUES (1, 'STEAK AND POTATOES', '8/23/23', 'Grilled steak served with mashed potatoes' );
INSERT INTO meal_plan(household_id, meal_name, planner_date, meal_plan_details) VALUES (2, 'TACO AND BEANS', '4/23/23', 'Taco with flour tortilla served with beans' );

INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (1, '1/3/24', 3);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (1, '1/4/24', 2);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (2, '1/5/24', 1);
INSERT INTO meal_plan_data(meal_plan_id, planner_date, meal_id) VALUES (2, '1/6/24', 3);


COMMIT TRANSACTION;
