BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS households;
DROP TABLE IF EXISTS meals_list;

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
    CONSTRAINT PK_household PRIMARY KEY (household_id),
    CONSTRAINT FK_user_id FOREIGN KEY REFERENCES users(user_id)
);

CREATE TABLE meals_list (
    meals_id SERIAL,
--    user_id int NOT NULL,
    meals varchar(50) NOT NULL,
    ingredients varchar(50) NOT NULL,
    CONSTRAINT PK_meals_id PRIMARY KEY (meals_id)
--    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO households(user_id) VALUES (1);

COMMIT TRANSACTION;
