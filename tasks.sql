-- 1.

-- 2.
USE shop;
SELECT name AS product_item, (SELECT name FROM catalogs WHERE id = products.catalog_id) AS catalog_item
FROM products;

-- 3.
USE aeroflot;

SELECT id,
       (SELECT name FROM cities WHERE label = flights.from) AS 'from',
       (SELECT name FROM cities WHERE label = flights.to)   AS 'to'
FROM flights;