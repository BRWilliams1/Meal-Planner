BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS meals_list;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE meals_list (
    meals_id SERIAL,
--    user_id int NOT NULL,
    list_of_items varchar(50) NOT NULL,
    list_of_ingredients varchar(50) NOT NULL,
    CONSTRAINT PK_meals_id PRIMARY KEY (meals_id)
--    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO meals_list(list_of_items, list_of_ingredients) VALUES ('PIZZA', 'cheese, sauce, crust, veggies, meats');
INSERT INTO meals_list(list_of_items, list_of_ingredients) VALUES ('PASTA', 'cheese, sauce, noodles, veggies, meats');
INSERT INTO meals_list(list_of_items, list_of_ingredients) VALUES ('BURGER', 'cheese, lettuce, tomato, bun, meat');
INSERT INTO meals_list(list_of_items, list_of_ingredients) VALUES ('TACO', 'cheese, lettuce, tomato, meat, tortilla');
INSERT INTO meals_list(list_of_items, list_of_ingredients) VALUES ('GRILLED CHICKEN', 'chicken, herbs, butter');
INSERT INTO meals_list(list_of_items, list_of_ingredients) VALUES ('SOUP', 'tomato, chicken, herbs, biscuits');
INSERT INTO meals_list(list_of_items, list_of_ingredients) VALUES ('CHICKEN SALAD', 'tomato, chicken, onions, dressing, cheese');


COMMIT TRANSACTION;
