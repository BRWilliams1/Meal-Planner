BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, meals_list, households, recipes, qtys, measurement_units, ingredients, households_recipes, recipes_ingredients, grocery_list;


CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE meals_list (
    meals_id SERIAL,
--user_id int NOT NULL,
    meals varchar(50) NOT NULL,
    ingredients varchar(50) NOT NULL,
    CONSTRAINT PK_meals_id PRIMARY KEY (meals_id)
--  CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE households (
    household_id SERIAL,
    user_id int NOT NULL,
    household_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_household PRIMARY KEY (household_id),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE recipes (
    recipe_id SERIAL,
    recipe_name VARCHAR(50) NOT NULL,
    instructions VARCHAR(200) NOT NULL,
    CONSTRAINT PK_recipe PRIMARY KEY (recipe_id)
);

--CREATE TABLE qtys (
--    qty_id SERIAL,
--    qty_amount int NOT NULL,
--    CONSTRAINT PK_qty PRIMARY KEY (qty_id)
--);

CREATE TABLE measurement_units (
    measurement_id SERIAL,
    measurement_type VARCHAR(50) NOT NULL,
    CONSTRAINT PK_measurement PRIMARY KEY (measurement_id)
);

CREATE TABLE ingredients (
    ingredient_id SERIAL,
    ingredient_name VARCHAR(50) NOT NULL,
    CONSTRAINT PK_ingredient PRIMARY KEY (ingredient_id)
);

CREATE TABLE households_recipes (
    household_id int NOT NULL,
    recipe_id int NOT NULL,
    CONSTRAINT FK_household_id FOREIGN KEY (household_id) REFERENCES households(household_id),
    CONSTRAINT FK_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
);

CREATE TABLE recipes_ingredients (
    recipe_id int NOT NULL,
    ingredient_id int NOT NULL,
    measurement_id int NOT NULL,
    qty int NOT NULL,
    CONSTRAINT FK_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    CONSTRAINT FK_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id),
    CONSTRAINT FK_measurement_id FOREIGN KEY (measurement_id) REFERENCES measurement_units(measurement_id)
--    CONSTRAINT FK_qty_id FOREIGN KEY (qty_id) REFERENCES qtys(qty_id)
);

CREATE TABLE grocery_list (
    household_id int NOT NULL,
    ingredient_id int NOT NULL,
    CONSTRAINT FK_household_id FOREIGN KEY (household_id) REFERENCES households(household_id),
    CONSTRAINT FK_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
);


COMMIT TRANSACTION;
