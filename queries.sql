CREATE TABLE MEAL (
  ID INT AUTO_INCREMENT,
  NAME VARCHAR(255),
  PRICE DOUBLE,
  CALORIES INT,
  PRIMARY KEY (ID)
);

INSERT INTO MEAL(NAME, PRICE, CALORIES)
VALUES ('Spaghetti Bolognese', 12.99, 600),
('Grilled Chicken Sandwich', 8.99, 400),
('Pesto Pasta', 10.99, 550),
('Steak and Mash', 19.99, 800),
('Sushi Platter', 15.99, 700);

CREATE TABLE CHEAP_MEAL AS
SELECT *
FROM MEAL
WHERE PRICE < 15;

CREATE TABLE INGREDIENT (
  ID INT AUTO_INCREMENT,
  NAME VARCHAR(255),
  PRICE DOUBLE,
  CONTAINS_LACTOSE BOOLEAN,
  VEGETARIAN BOOLEAN,
  VEGAN BOOLEAN,
  GLUTEN_FREE BOOLEAN,
  PRIMARY KEY (ID)
);

INSERT INTO INGREDIENT (NAME, PRICE, CONTAINS_LACTOSE, VEGETARIAN, VEGAN, GLUTEN_FREE)
VALUES ('Eggs', 2.50, false, true, false, true),
('Bread', 1.90, false, true, true, false),
('Beef Patty', 4.35, false, false, false, true),
('Lettuce', 1.50, false, true, true, true),
('Yoghurt', 2.00, true, true, false, true);

--creo table vuota come un clone della table ingredient
CREATE TABLE VEGAN_INGREDIENT AS
SELECT *
FROM INGREDIENT
WHERE FALSE;

--inserisco dati dentro la table vuota
INSERT INTO VEGAN_INGREDIENT
SELECT *
FROM INGREDIENT
WHERE VEGAN;

CREATE VIEW EXPENSIVE_MEAL AS
SELECT *
FROM MEAL
WHERE PRICE > 15;

CREATE VIEW LACTOSE_FREE_INGREDIENT AS
SELECT *
FROM INGREDIENT
WHERE !CONTAINS_LACTOSE;

CREATE VIEW HIGH_CALORIE_MEAL AS
SELECT *
FROM MEAL
WHERE CALORIES > 650;
