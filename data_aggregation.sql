-- 1.

SELECT FLOOR(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW()))) AS average_age
FROM users;

-- 2.

-- 3.
SELECT ROUND(EXP(SUM(LOG(value))))
FROM storehouses_products
WHERE value != 0;


-- вот такой вариант без погрешностей
DROP PROCEDURE proizved;
CREATE PROCEDURE proizved()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE proiz BIGINT DEFAULT 1;
    DECLARE b INT;
    DECLARE cur_for_proiz CURSOR FOR SELECT value FROM shop.storehouses_products WHERE value IS NOT NULL AND value != 0;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur_for_proiz;

    proizved_loop:
    LOOP
        FETCH cur_for_proiz INTO b;
        IF done THEN
            LEAVE proizved_loop;
        END IF;
        SET proiz := b * proiz;
    END LOOP;
    CLOSE cur_for_proiz;
    SELECT proiz AS proi;

END;

CALL proizved();