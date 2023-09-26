BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS households;
DROP TABLE IF EXISTS meals_list;
DROP TABLE IF EXISTS household_recipes;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS recipe_ingredients;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS measurement_units;
DROP TABLE IF EXISTS measurement_qty;
DROP TABLE IF EXISTS grocery_list;

DROP SEQUENCE IF EXISTS recipe_id;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE households (
    household_id SERIAL,
    user_id int NOT NULL,
    household_name varchar(50) NOT NULL,
    CONSTRAINT PK_household PRIMARY KEY (household_id),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE meals_list (
    meals_id SERIAL,
--  user_id int NOT NULL,
    meals varchar(50) NOT NULL,
    ingredients varchar(50) NOT NULL,
    CONSTRAINT PK_meals_id PRIMARY KEY (meals_id)
--  CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE SEQUENCE recipe_id
  INCREMENT BY 1
  START WITH 1001
  NO MAXVALUE;

 CREATE TABLE recipes(
    recipe_id SERIAL,
    recipe_name varchar(200) NOT NULL,
    instruction varchar(200) NOT NULL,
     CONSTRAINT PK_recipe_id PRIMARY KEY (recipe_id)
 );

CREATE TABLE household_recipes(
    household_id int NOT NULL,
    recipe_id int NOT NULL,
     CONSTRAINT FK_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
     CONSTRAINT FK_household_id FOREIGN KEY (household_id) REFERENCES households(household_id)
    );

 CREATE TABLE ingredients(
     ingredient_id SERIAL,
     ingredient_name VARCHAR(50) NOT NULL,
     CONSTRAINT PK_ingredient_id PRIMARY KEY (ingredient_id)

     );

     CREATE TABLE measurement_units(
     measurement_id SERIAL,
     measurement_type varchar(50) NOT NULL,
     CONSTRAINT PK_measurement_id PRIMARY KEY (measurement_id)
     );

      CREATE TABLE measurement_qty(
         qty_id SERIAL,
         qty_amt int NOT NULL,
         CONSTRAINT PK_qty_id PRIMARY KEY (qty_id)
          );

 CREATE TABLE recipe_ingredients(
    ingredient_id int,
    recipe_id int,
    qty_id int,
    measurement_id int,
    CONSTRAINT FK_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id),
    CONSTRAINT FK_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    CONSTRAINT FK_measurement_id FOREIGN KEY (measurement_id) REFERENCES measurement_units(measurement_id),
    CONSTRAINT FK_qty_id FOREIGN KEY (qty_id) REFERENCES measurement_qty(qty_id)

    );

          CREATE TABLE grocery_list(
           household_id int,
           ingredient_id int,
           CONSTRAINT FK_household_id FOREIGN KEY (household_id) REFERENCES households(household_id),
           CONSTRAINT FK_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id)
             );


COMMIT TRANSACTION;
