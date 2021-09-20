use vk;
UPDATE friend_requests
SET target_user_id = IF(target_user_id = 50, target_user_id - 2, target_user_id + 1);
ALTER TABLE friend_requests
    ADD CHECK ( target_user_id != friend_requests.initiator_user_id );



-- ------------------------------ надеюсь я правльно понял задание повторил действия и добавил таблицы
-- --------------------------------- из ДЗ 3, во второй задаче наполню эти таблицы



DROP TABLE IF EXISTS media_likes; -- ничем не отличается от наших первых лайков
CREATE TABLE media_likes
(
    id         SERIAL,
    user_id    BIGINT UNSIGNED NOT NULL,
    media_id   BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (media_id) REFERENCES media (id)
);

DROP TABLE IF EXISTS user_likes; -- лайки пользователям
CREATE TABLE user_likes
(
    initial_user BIGINT UNSIGNED NOT NULL,
    target_user  BIGINT UNSIGNED NOT NULL,
    created_at   DATETIME DEFAULT NOW(),

    PRIMARY KEY (initial_user, target_user), --  один пользователь один лайк
    FOREIGN KEY (initial_user) REFERENCES users (id),
    FOREIGN KEY (target_user) REFERENCES media (id)
);


DROP TABLE IF EXISTS posts;
CREATE TABLE posts -- создадим таблиц постов
(
    id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(30),
    author_id  BIGINT UNSIGNED NOT NULL,
    body       TEXT,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (author_id) REFERENCES users (id)
);


DROP TABLE IF EXISTS post_likes; -- лайки для постов
CREATE TABLE post_likes
(
    id         SERIAL,
    user_id    BIGINT UNSIGNED NOT NULL,
    post_id    BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (post_id) REFERENCES posts (id)
);