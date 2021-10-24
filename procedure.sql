-- 1.

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello()
    RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE time INT DEFAULT HOUR(NOW());
    IF (time > 5 AND time < 12) THEN
        RETURN 'Доброе утро!';
    ELSEIF (time > 11 AND time < 18) THEN
        RETURN 'Добрый день!';
    ELSEIF (time > 17 AND time < 24) THEN
        RETURN 'Добрый вечер!';
    ELSE
        RETURN 'Доброй ночи!';

    END IF;
END //
DELIMITER ;
SELECT hello();

-- 2.

CREATE TRIGGER;

USE shop;
SHOW TABLES;
SELECT *
FROM catalogs;
ALTER TABLE products
    ADD COLUMN col_count INT DEFAULT NULL;
SELECT * FROM products;
DELIMITER //
CREATE TRIGGER mul
    AFTER INSERT
    ON catalogs
    FOR EACH ROW
BEGIN
    UPDATE products SET col_count = (SELECT count(*) FROM catalogs);
END //
DELIMITER ;
DROP TRIGGER mul;

SELECT COUNT(*)
FROM catalogs;
INSERT INTO catalogs(id, name)
VALUES (DEFAULT, 'ew');



