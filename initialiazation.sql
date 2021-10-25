-- наполняем таблицы --
-- --------------------------------
USE kinopoisk;

-- функции в самом низу

-- ------------------- TRIGGERS ----------------------------


-- likes_reviews
DELIMITER //
DROP TRIGGER IF EXISTS count_likes //
CREATE TRIGGER count_likes
    AFTER INSERT
    ON reviews_likes
    FOR EACH ROW
BEGIN
    UPDATE reviews
    SET count_likes = (SELECT COUNT(*) FROM reviews_likes WHERE review_id = new.review_id)
    WHERE id = new.review_id;
END //
DELIMITER ;


-- movie_ratings
DELIMITER //
DROP TRIGGER IF EXISTS rating //
CREATE TRIGGER rating
    AFTER INSERT
    ON movie_ratings
    FOR EACH ROW
BEGIN
    UPDATE movies
    SET avg_rating = (SELECT AVG(rate) FROM movie_ratings WHERE movie_id = new.movie_id)
    WHERE id = new.movie_id;
END //
DELIMITER ;
-- ---------------------------------------------------------


-- 1. наполним жанры из файла

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\genres.txt' INTO TABLE genres (genre);

-- --------------------------------

-- 2. Наполним создателей

INSERT INTO creator_type (id, title)
VALUES (DEFAULT, 'режиссер'),
       (DEFAULT, 'сценарист'),
       (DEFAULT, 'оператор'),
       (DEFAULT, 'звукорежиссер'),
       (DEFAULT, 'композитор'),
       (DEFAULT, 'костюмер'),
       (DEFAULT, 'гриммер'),
       (DEFAULT, 'декоратор'),
       (DEFAULT, 'стилист'),
       (DEFAULT, 'свет'),
       (DEFAULT, 'коммерчиский директор');

-- 3. Наполним виды кино

INSERT INTO movie_types
VALUES (DEFAULT, 'Художественное кино'),
       (DEFAULT, 'Документальное кино'),
       (DEFAULT, 'Мультфильм'),
       (DEFAULT, 'Фильм-спектакль'),
       (DEFAULT, 'Мьюзикл'),
       (DEFAULT, 'Научно-популярное кино'),
       (DEFAULT, 'Образовательный фильм');

-- 4. Наполним типы медиафайлов

INSERT INTO media_type
VALUES (DEFAULT, 'Видео'),
       (DEFAULT, 'Документ'),
       (DEFAULT, 'Аудио'),
       (DEFAULT, 'Изображение'),
       (DEFAULT, 'Таблица'),
       (DEFAULT, 'Архив');

-- 5.

INSERT INTO users
VALUES (DEFAULT, 'log1', 'mail@mail.ru', 74997875696, '8743b52063cd84097a6fhf33f5c74f5'),
       (DEFAULT, 'denim', 'denim@mail.ru', 74995105696, '8743b52063cd84097a6td1633f5c74f5'),
       (DEFAULT, 'sunrise', 'sunrise@mail.ru', 74497105696, '8743b52063cd8fff7a65d1633f5c74f5'),
       (DEFAULT, 'superman', 'superman@mail.ru', 74997105696, '8743b52063cdhj097a65d1633f5c74f5'),
       (DEFAULT, 'tiesto', 'tiesto@mail.ru', 74911105696, '8743b52063cd84097y65d1633f5c74f5'),
       (DEFAULT, 'jordan', 'jordan@mail.ru', 74922105696, '8743b52063cd8409ll65d1633f5c74f5'),
       (DEFAULT, 'noname', 'noname@mail.ru', 74933105696, '8743b52063cd840dcv65d1633f5c74f5'),
       (DEFAULT, 'clipper', 'clipper@mail.ru', 75545105696, '8743b52063cd84ew7a65d1633f5c74f5'),
       (DEFAULT, 'robot_vector', 'robot_vector@mail.ru', 74997665696, '8743dfg2063cd84097a65d1633f5c74f5'),
       (DEFAULT, 'transformer', 'transformer@mail.ru', 74997107796, '8743b525r3cd84097a65d1633f5c74f5'),
       (DEFAULT, 'tiguan', 'tiguan@mail.ru', 74977735696, '8743b52063cd8409567u5d1633f5c74f5');

-- 6. заполним media

INSERT INTO media(id, user_id, media_type_id, filename, size, created_at, updated_at)
VALUES (DEFAULT, 1, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 2, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 3, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 4, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 5, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 6, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 7, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 8, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 9, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 10, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 11, 4, 'photo.jpg', 222222, DEFAULT, DEFAULT);

INSERT INTO media(id, user_id, media_type_id, filename, size, created_at, updated_at)
VALUES (DEFAULT, 1, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 2, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 3, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 4, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 5, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 6, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 7, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 8, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 9, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT),
       (DEFAULT, 10, 1, 'trailer.jpg', 222222, DEFAULT, DEFAULT);


-- 7. заполняем profiles
INSERT IGNORE
INTO profiles
VALUES (1, 'm', 'Andrey', 'Petrov', '22-12-1982', 'Sverdlovsk', 1, DEFAULT),
       (2, 'm', 'Sergey', 'Sidorov', '22-12-1982', 'Moscow', 2, DEFAULT),
       (3, 'm', 'Valery', 'Epifanv', '22-12-1982', 'Kaluga', 3, DEFAULT),
       (4, 'm', 'Nickolay', 'Romanov', '22-12-1982', 'Saint-Petersburg', 4, DEFAULT),
       (5, 'm', 'Ivan', 'Galcev', '22-12-1982', 'Murmansk', 5, DEFAULT),
       (6, 'f', 'Tatyana', 'Rumyanzeva', '22-12-1982', 'Vsevolojsk', 6, DEFAULT),
       (7, 'm', 'Zahar', 'Lipkin', '22-12-1982', 'Kirshi', 7, DEFAULT),
       (8, 'f', 'Ludmila', 'Trubnikov', '22-12-1982', 'Tomsk', 8, DEFAULT),
       (9, 'm', 'Evgenia', 'Zaharova', '22-12-1982', 'Omsk', 9, DEFAULT),
       (10, 'm', 'Marat', 'Tulkin', '22-12-1982', 'Habarovsk', 10, DEFAULT),
       (11, 'm', 'Timofey', 'Pukalo', '22-12-1982', 'Novosibisk', 11, DEFAULT);


-- 8. заполним movies

INSERT INTO movies(id, name, genre_id, year, country, movie_type_id, description, avg_rating)
VALUES (DEFAULT, 'В бой идут одни старики', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'СССР',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT),
       (DEFAULT, 'Пятница', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'USA',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT),
       (DEFAULT, 'После дождечка в четверг', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'Great Britain',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT),
       (DEFAULT, 'Большая туса', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'Russia',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT),
       (DEFAULT, 'Корупционер', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'Australia',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT),
       (DEFAULT, 'Мажор', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'Ukraine',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT),
       (DEFAULT, 'Жили-были', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'Ussr',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT),
       (DEFAULT, 'Параход', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'Russia',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT),
       (DEFAULT, 'Любовь и голуби', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'СССР',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT),
       (DEFAULT, 'Темнота', FLOOR(1 + (RAND() * 32)), FLOOR(1895 + (RAND() * 126)), 'Russia',
        FLOOR(1 + (RAND() * 7)), 'description', DEFAULT);

-- 9. Заполним трэйлеры

INSERT INTO trailers(id, title, media_id)
VALUES (DEFAULT, 'Трейлер к фильму', 12),
       (DEFAULT, 'Трейлер к фильму', 13),
       (DEFAULT, 'Трейлер к фильму', 14),
       (DEFAULT, 'Трейлер к фильму', 15),
       (DEFAULT, 'Трейлер к фильму', 16),
       (DEFAULT, 'Трейлер к фильму', 17),
       (DEFAULT, 'Трейлер к фильму', 18),
       (DEFAULT, 'Трейлер к фильму', 19),
       (DEFAULT, 'Трейлер к фильму', 20),
       (DEFAULT, 'Трейлер к фильму', 21);

-- 10. Заполним связь trailers_movies
INSERT INTO trailers_movies
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10);
-- 11. Наполним актеров

INSERT INTO actors(id, first_name, last_name, birthday_at, country, biography)
VALUES (DEFAULT, 'Djon', 'Travolta', STR_TO_DATE('11-03-1975', '%d-%m-%Y'), 'Usa', 'biography'),
       (DEFAULT, 'Alexandr', 'Bezrukov', STR_TO_DATE('20-06-1979', '%d-%m-%Y'), 'Russia', 'biography'),
       (DEFAULT, 'Semen', 'Svetlakov', STR_TO_DATE('3-05-1985', '%d-%m-%Y'), 'Russia', 'biography'),
       (DEFAULT, 'Evgeniy', 'Pchelkin', STR_TO_DATE('31-05-1995', '%d-%m-%Y'), 'Russia', 'biography'),
       (DEFAULT, 'Roman', 'Naumov', STR_TO_DATE('13-05-1965', '%d-%m-%Y'), 'Russia', 'biography'),
       (DEFAULT, 'Oleg', 'Tabakov', STR_TO_DATE('25-05-1972', '%d-%m-%Y'), 'Russia', 'biography'),
       (DEFAULT, 'Evgeniy', 'Smaktunovsky', STR_TO_DATE('2-09-1988', '%d-%m-%Y'), 'Russia', 'biography'),
       (DEFAULT, 'Tatyana', 'Fedorova', STR_TO_DATE('16-08-1966', '%d-%m-%Y'), 'Russia', 'biography'),
       (DEFAULT, 'Nikita', 'Michalkov', STR_TO_DATE('22-06-1954', '%d-%m-%Y'), 'Russia', 'biography'),
       (DEFAULT, 'Semen', 'Habibulin', STR_TO_DATE('5-05-1983', '%d-%m-%Y'), 'Russia', 'biography');

-- 12. Наполним создателей

INSERT creators(id, first_name, last_name, birthday_at, country, biography, creator_type_id)
VALUES (DEFAULT, 'Роман', 'Башаров', STR_TO_DATE('11-03-1975', '%d-%m-%Y'), 'Russia', 'biography', 1),
       (DEFAULT, 'Semen', 'Ermolin', STR_TO_DATE('22-06-1954', '%d-%m-%Y'), 'Usa', 'biography', 1),

       (DEFAULT, 'Mickal', 'Cors', STR_TO_DATE('5-05-1983', '%d-%m-%Y'), 'Usa', 'biography', 2),
       (DEFAULT, 'Gleb', 'Usupov', STR_TO_DATE('2-09-1988', '%d-%m-%Y'), 'Russia', 'biography', 2),

       (DEFAULT, 'Роман', 'Ivanov', STR_TO_DATE('5-05-1983', '%d-%m-%Y'), 'Australia', 'biography', 3),
       (DEFAULT, 'Nickita', 'Prudnickov', STR_TO_DATE('11-03-1975', '%d-%m-%Y'), 'Russia', 'biography', 3),

       (DEFAULT, 'Anatoly', 'Petrov', STR_TO_DATE('2-09-1988', '%d-%m-%Y'), 'Ukraine', 'biography', 4),
       (DEFAULT, 'Oleg', 'Roy', STR_TO_DATE('14-03-1965', '%d-%m-%Y'), 'Ussr', 'biography', 4),

       (DEFAULT, 'Tomara', 'Gorbacheva', STR_TO_DATE('11-02-1976', '%d-%m-%Y'), 'Estonia', 'biography', 5),
       (DEFAULT, 'Konstantin', 'Hlebnick', STR_TO_DATE('1-07-1985', '%d-%m-%Y'), 'Russia', 'biography', 5),

       (DEFAULT, 'Timur', 'Antonov', STR_TO_DATE('15-03-1995', '%d-%m-%Y'), 'Latvia', 'biography', 6),
       (DEFAULT, 'Sergey', 'Tachko', STR_TO_DATE('17-04-1972', '%d-%m-%Y'), 'Mexica', 'biography', 6),

       (DEFAULT, 'Elena', 'Panovich', STR_TO_DATE('13-06-198', '%d-%m-%Y'), 'Francia', 'biography', 7),
       (DEFAULT, 'Svetlana', 'Nevzorova', STR_TO_DATE('1-12-1985', '%d-%m-%Y'), 'Australia', 'biography', 7),

       (DEFAULT, 'Gleb', 'Glebov', STR_TO_DATE('19-09-1934', '%d-%m-%Y'), 'Canada', 'biography', 8),
       (DEFAULT, 'Ilya', 'Laushev', STR_TO_DATE('11-11-1967', '%d-%m-%Y'), 'Usa', 'biography', 8),

       (DEFAULT, 'Alexandr', 'Boyarov', STR_TO_DATE('15-05-1975', '%d-%m-%Y'), 'Polsha', 'biography', 9),
       (DEFAULT, 'Tom', 'Kurts', STR_TO_DATE('12-08-1955', '%d-%m-%Y'), 'China', 'biography', 9),

       (DEFAULT, 'Richard', 'Velengton', STR_TO_DATE('10-03-1966', '%d-%m-%Y'), 'Germany', 'biography', 10),
       (DEFAULT, 'Birma', 'Stuard', STR_TO_DATE('9-09-1999', '%d-%m-%Y'), 'Russia', 'biography', 10),

       (DEFAULT, 'Patrick', 'Svayzy', STR_TO_DATE('11-06-1995', '%d-%m-%Y'), 'Usa', 'biography', 11),
       (DEFAULT, 'Elena', 'Bautina', STR_TO_DATE('7-07-1992', '%d-%m-%Y'), 'Russia', 'biography', 11);

-- 13. наполним reviews

DELIMITER //
DROP PROCEDURE IF EXISTS reviews_filler;
CREATE PROCEDURE reviews_filler()
BEGIN
    DECLARE counts INT DEFAULT 1000;
    DECLARE mov BIGINT DEFAULT (SELECT COUNT(*) FROM movies);
    DECLARE us BIGINT DEFAULT (SELECT COUNT(*) FROM users);
    WHILE counts != 0
        DO
            INSERT IGNORE INTO reviews(id, user_id, movie_id, body, created_at, updated_at, count_likes)
            VALUES (DEFAULT, FLOOR(1 + (RAND() * us)), FLOOR(1 + (RAND() * mov)), 'body', DEFAULT, DEFAULT, DEFAULT);
            SET counts = counts - 1;
        END WHILE;
END//
DELIMITER ;
CALL reviews_filler;


-- 14. Заполним rating filler

DELIMITER //
DROP PROCEDURE IF EXISTS rating_filler //
CREATE PROCEDURE rating_filler()
BEGIN
    DECLARE mov INT DEFAULT (SELECT COUNT(*) FROM movies);
    DECLARE us INT DEFAULT (SELECT COUNT(*) FROM users);
    DECLARE counts INT DEFAULT 1000;
    WHILE counts != 0
        DO
            INSERT IGNORE INTO movie_ratings(user_id, movie_id, rate)
            VALUES (FLOOR(1 + (RAND() * us)), FLOOR(1 + (RAND() * mov)), FLOOR(1 + (RAND() * 10)));
            SET counts = counts - 1;
        END WHILE;
END //
DELIMITER ;
CALL rating_filler();

DELIMITER //
DROP PROCEDURE IF EXISTS reviews_likes_filler;
CREATE PROCEDURE reviews_likes_filler()
BEGIN
    DECLARE counts INT DEFAULT 1000;
    DECLARE us INT DEFAULT (SELECT COUNT(*) FROM users);
    DECLARE rv INT DEFAULT (SELECT COUNT(*) FROM reviews);
    WHILE counts != 0
        DO
            INSERT IGNORE INTO reviews_likes(user_id, review_id)
            VALUES (FLOOR(1 + (RAND() * us)), FLOOR(1 + (RAND() * rv)));
            SET counts = counts - 1;
        END WHILE;
END //
DELIMITER ;
CALL reviews_likes_filler;


-- --------------------------------------
