USE kinopoisk;

-- ----------------JOINS and SELECTS--------------------

SELECT g.genre, m.name
FROM genres g
         LEFT JOIN movies m ON g.id = m.genre_id;

SELECT movies.name 'Название', g.genre 'Жанр'
FROM movies
         JOIN genres g ON movies.genre_id = g.id
ORDER BY g.genre;

SELECT m.name 'Название', m.country, m.year, g.genre, r.body
FROM movies m
         JOIN reviews r ON m.id = r.movie_id
         JOIN genres g ON g.id = m.genre_id
ORDER BY m.name;

SELECT p.user_id,
       CONCAT(p.first_name, ' ', p.last_name)                                              AS name,
       (SELECT COUNT(*) FROM reviews WHERE p.user_id = reviews.user_id GROUP BY p.user_id) AS count_of_post
FROM profiles p
ORDER BY p.user_id DESC;

-- ------------------ VIEWS ---------------------------------------

-- ---------------- movie information
DROP VIEW IF EXISTS movie_info;
CREATE OR REPLACE VIEW movie_info AS
SELECT m.name,
       g.genre,
       m.year,
       m.avg_rating                                             AS average_rating,
       (SELECT COUNT(*) FROM reviews r WHERE r.movie_id = m.id) AS count_of_reviews
FROM movies m
         JOIN genres g ON g.id = m.genre_id;

-- ----- users information

CREATE OR REPLACE VIEW users_info AS
SELECT CONCAT(p.first_name, ' ', p.last_name)                               AS name,
       TIMESTAMPDIFF(YEAR, p.birthday_at, CURDATE())                        AS age,
       p.hometown,
       u.email                                                              AS email,
       (SELECT COUNT(*) FROM reviews r WHERE r.user_id = p.user_id)         AS count_of_revies,
       (SELECT COUNT(*) FROM reviews_likes rl WHERE rl.user_id = p.user_id) AS likes_activities,
       (SELECT COUNT(*) FROM movie_ratings mr WHERE mr.user_id = p.user_id) AS rate_activities
FROM profiles p
         JOIN users u ON p.user_id = u.id;

