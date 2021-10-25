DROP DATABASE IF EXISTS kinopoisk;
CREATE DATABASE kinopoisk;
USE kinopoisk;


DROP TABLE IF EXISTS genres;
CREATE TABLE genres
(
    id    TINYINT UNSIGNED   NOT NULL AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(50) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS movie_types;
CREATE TABLE movie_types
(
    id   SERIAL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS movies;
CREATE TABLE movies
(
    id            SERIAL,
    name          VARCHAR(50)      NOT NULL COMMENT 'Название фильма',
    genre_id      TINYINT UNSIGNED NOT NULL,
    year          YEAR,
    country       VARCHAR(255),
    movie_type_id BIGINT UNSIGNED  NOT NULL,
    description   TEXT,
    avg_rating    TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Средняя оцека (триггер) с ограничением 1-10',
    PRIMARY KEY (id),
    FOREIGN KEY (movie_type_id) REFERENCES movie_types (id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    INDEX idx_movie (name)
);

DROP TABLE IF EXISTS actors;
CREATE TABLE actors
(
    id          SERIAL AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(255) NOT NULL,
    last_name   VARCHAR(255) NOT NULL,
    birthday_at DATE,
    country     VARCHAR(255),
    biography   TEXT
);
DROP TABLE IF EXISTS movies_actors;
CREATE TABLE movies_actors
(
    movies_id BIGINT UNSIGNED NOT NULL,
    actor_id  BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (movies_id, actor_id),
    FOREIGN KEY (movies_id) REFERENCES movies (id),
    FOREIGN KEY (actor_id) REFERENCES actors (id)
);

DROP TABLE IF EXISTS creator_type;
CREATE TABLE creator_type
(
    id    SERIAL,
    title VARCHAR(255) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS creators;
CREATE TABLE creators
(
    id              SERIAL AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(255)    NOT NULL,
    last_name       VARCHAR(255)    NOT NULL,
    birthday_at     DATE,
    country         VARCHAR(255),
    biography       TEXT,
    creator_type_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (creator_type_id) REFERENCES creator_type (id)
);

DROP TABLE IF EXISTS movies_creator;
CREATE TABLE movies_creator
(
    movies_id       BIGINT UNSIGNED NOT NULL,
    creator_id      BIGINT UNSIGNED NOT NULL,
    creator_type_id BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (movies_id, creator_id, creator_type_id),
    FOREIGN KEY (movies_id) REFERENCES movies (id),
    FOREIGN KEY (creator_id) REFERENCES creators (id),
    FOREIGN KEY (creator_type_id) REFERENCES creators (creator_type_id)
);

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    id          SERIAL AUTO_INCREMENT PRIMARY KEY,
    login       VARCHAR(255) UNIQUE    NOT NULL,
    email       VARCHAR(255) UNIQUE    NOT NULL,
    phone       BIGINT UNSIGNED UNIQUE NOT NULL,
    passwd_hash VARCHAR(255)           NOT NULL
);

DROP TABLE IF EXISTS media_type;
CREATE TABLE media_type
(
    id   SERIAL,
    name VARCHAR(255) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS media;
CREATE TABLE media
(
    id            SERIAL,
    user_id       BIGINT UNSIGNED NOT NULL,
    media_type_id BIGINT UNSIGNED NOT NULL,
    filename      VARCHAR(50)     NOT NULL,
    `size`        INT             NOT NULL,
    created_at    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (media_type_id) REFERENCES media_type (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);


DROP TABLE IF EXISTS trailers;
CREATE TABLE trailers
(
    id       SERIAL PRIMARY KEY,
    title    VARCHAR(255),
    media_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (media_id) REFERENCES media (id)

);

DROP TABLE IF EXISTS trailers_movies;
CREATE TABLE trailers_movies
(
    movie_id   BIGINT UNSIGNED NOT NULL,
    trailer_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies (id),
    FOREIGN KEY (trailer_id) REFERENCES trailers (id)
);


--  ------------------------------------------------------------------------------

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles
(
    user_id     BIGINT UNSIGNED NOT NULL UNIQUE,
    gender      ENUM ('f','m')  NOT NULL,
    first_name  VARCHAR(255)    NOT NULL,
    last_name   VARCHAR(255)    NOT NULL,
    birthday_at DATE,
    hometown    VARCHAR(255),
    photo_id    BIGINT UNSIGNED          DEFAULT NULL,
    created_at  DATETIME        NOT NULL DEFAULT NOW(),
    INDEX idx_first_name_last_name (first_name, last_name),

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (photo_id) REFERENCES media (id)
);

DROP TABLE IF EXISTS movie_ratings;
CREATE TABLE movie_ratings
(
    user_id  BIGINT UNSIGNED                                 NOT NULL,
    movie_id BIGINT UNSIGNED                                 NOT NULL,
    rate     ENUM ('1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT 1 COMMENT 'Лучше реализовть программно ограничение либо триггер',

    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (movie_id) REFERENCES movies (id)
);

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews
(
    id          SERIAL,
    user_id     BIGINT UNSIGNED NOT NULL,
    movie_id    BIGINT UNSIGNED NOT NULL,
    body        TEXT            NOT NULL,
    created_at  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_ay  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    count_likes BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Количество лайков (триггер)',

    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (movie_id) REFERENCES movies (id)
);

ALTER TABLE reviews RENAME COLUMN updated_ay TO updated_at;

DROP TABLE IF EXISTS likes;
CREATE TABLE likes
(
    user_id   BIGINT UNSIGNED NOT NULL,
    review_id BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (user_id, review_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (review_id) REFERENCES reviews (id)
);
ALTER TABLE likes RENAME TO reviews_likes;
-- -------------------------------------------------
