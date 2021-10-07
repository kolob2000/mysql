-- 1.

START TRANSACTION;
INSERT INTO sample.users
SELECT *
FROM shop.users
WHERE id = 1;
DELETE
FROM shop.users
WHERE id = 1;
COMMIT;

-- 2.

USE shop;
CREATE OR REPLACE VIEW view_products AS
SELECT p.name AS name, c.name AS catalog
FROM products p
         JOIN catalogs c ON c.id = p.catalog_id;
SELECT *
FROM view_products;

-- 3.

USE vk;
SET @d = DATE('2018-07-31');
SELECT @d := @d + INTERVAL 1 DAY                                                 AS date,
       IF((SELECT COUNT(birthday) FROM profiles WHERE birthday = @d) != 0, 1, 0) AS absence
FROM profiles
LIMIT 31;

-- 4.

DELETE
FROM profiles
WHERE birthday NOT IN (SELECT * FROM (SELECT birthday FROM profiles ORDER BY birthday DESC LIMIT 5) AS t1)
   OR birthday IS NULL;