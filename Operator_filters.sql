-- 1.
USE shop;
UPDATE users
SET created_at = NOW(),
    updated_at = NOW();

-- 2.
ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;

-- 3.
SELECT *
FROM storehouses_products
ORDER BY  value = 0 ASC, value ASC;

-- 4.
SELECT * FROM users WHERE date_format(birthday_at, '%M') IN ('may', 'august');

-- 5.
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY id = 5 DESC , id = 1 DESC, id =2 DESC ;
