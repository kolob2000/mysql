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
