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


COMMIT TRANSACTION;
