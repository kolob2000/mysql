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