-- 1.

-- 2.

-- 3.
USE aeroflot;

SELECT id,
       (SELECT name FROM cities WHERE label = flights.from) AS 'from',
       (SELECT name FROM cities WHERE label = flights.to)                  AS 'to'
FROM flights;