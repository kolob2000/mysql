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
SELECT * FROM view_products;

-- 3.

USE vk;
SET @d = date ('2018-07-31');
SELECT @d := @d + INTERVAL 1 DAY as date, if((select count(birthday) from profiles WHERE birthday = @d) != 0 ,1, 0) as absence FROM profiles limit 31;
