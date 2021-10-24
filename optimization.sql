-- 1.
USE shop;
DROP TABLE IF EXISTS logs;
CREATE TABLE logs
(
    created_at DATETIME     NOT NULL,
    table_name VARCHAR(100) NOT NULL,
    row_id     BIGINT       NOT NULL,
    name       VARCHAR(255) NOT NULL
) ENGINE = ARCHIVE;


-- -------------------- Триггер при вставки в users
DROP TRIGGER IF EXISTS users_log;
DELIMITER //
CREATE TRIGGER users_log
    AFTER INSERT
    ON users
    FOR EACH ROW
BEGIN
    INSERT INTO logs (created_at, table_name, row_id, name)
    VALUES (CURRENT_TIMESTAMP, 'users', new.id, new.name);
END //
DELIMITER ;


-- -------------------- Триггер при вставки в catalogs
DROP TRIGGER IF EXISTS catalogs_log;
DELIMITER //
CREATE TRIGGER catalogs_log
    AFTER INSERT
    ON catalogs
    FOR EACH ROW
BEGIN
    INSERT INTO logs (created_at, table_name, row_id, name)
    VALUES (CURRENT_TIMESTAMP, 'catalogs', new.id, new.name);
END //
DELIMITER ;


-- -------------------- Триггер при вставки в products
DROP TRIGGER IF EXISTS products_log;
DELIMITER //
CREATE TRIGGER products_log
    AFTER INSERT
    ON products
    FOR EACH ROW
BEGIN
    INSERT INTO logs (created_at, table_name, row_id, name)
    VALUES (CURRENT_TIMESTAMP, 'products', new.id, new.name);
END //
DELIMITER ;