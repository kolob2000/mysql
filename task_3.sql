-- C - create
DROP DATABASE IF EXISTS coffee_shop;
CREATE DATABASE coffee_shop;
USE coffee_shop;
DROP TABLE IF EXISTS coffee_items;
CREATE TABLE coffee_items
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(50),
    description VARCHAR(50),
    quantity    BIGINT
);
INSERT INTO coffee_items(name, description, quantity)
VALUES ('Jacobs', 'just coffee', 25);

INSERT IGNORE INTO coffee_items(name, description, quantity)
VALUES ('Egoist', 'Super coffee!!!', 55);

INSERT INTO coffee_items(name, description, quantity)
VALUES ((SELECT firstname FROM vk.users WHERE users.id = 5),
        'New coffee)))',
        33);
INSERT INTO coffee_items SELECT id, firstname, lastname, phone FROM vk.users WHERE id > 5;

-- R - read

SELECT * FROM coffee_items;
SELECT name FROM coffee_items WHERE name LIKE 'D%';

SELECT quantity FROM coffee_items WHERE quantity < 50 AND quantity > 20;

-- U -  update

UPDATE coffee_items SET name = 'Nescafe', quantity = 40 WHERE id = 25;

-- D - Delete
DELETE FROM coffee_items
WHERE id = 23;

TRUNCATE coffee_items;
