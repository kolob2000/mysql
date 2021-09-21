drop database if exists vk;
create database vk;
use vk;
drop table if exists users;
create table users(
    id bigint unsigned not null auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50) comment 'Фамилия',
    email varchar(120) unique,
    passwd_hash varchar(100),
    phone bigint unsigned unique,

    index users_firstname_lastname_idx(first_name, last_name)
);

drop table if exists profiles;
create table profiles(
    user_id bigint unsigned not null unique,
    gender char(1),
    birthday date,
    hometown varchar(100),
    photo_id bigint unsigned not null ,
    created_at datetime default now()
);

alter table profiles add constraint
    foreign key(user_id) references users(id)
    on update cascade
    on delete restrict;

drop table if exists messages;
create table messages(
    id serial ,
    from_user_id bigint unsigned not null,
    to_user_id bigint unsigned not null,
    body text,
    created_at datetime default now(),
    foreign key (from_user_id) references users(id),
    foreign key (to_user_id) references users(id)
);

drop table if exists friend_requests;
create table friend_requests(
    initiator_user_id bigint unsigned not null ,
    target_user_id bigint unsigned not null ,
    `status` enum('requested', 'approved', 'declined', 'unfriended'),
    requested_at datetime default now(),
    updated_at datetime default current_timestamp,

    primary key (initiator_user_id, target_user_id),
    foreign key (initiator_user_id) references users(id),
    foreign key (target_user_id) references users(id)
);

alter table friend_requests
add check ( initiator_user_id <> target_user_id );

drop table if exists communities;
create table communities(
    id serial,
    name varchar(100),
    admin_user_id bigint unsigned not null,

    index communities_name_idx(name),
    foreign key (admin_user_id) references users(id)
);

drop table  if exists users_communities;
create table users_communities(
    users_id bigint unsigned not null ,
    community_id bigint unsigned not null ,

    primary key (users_id, community_id) ,
    foreign key (users_id) references users(id),
    foreign key (community_id) references communities(id)
);

drop table if exists media_type;
create table media_type(
    id serial,
    name varchar(10),
    created_at datetime default now(),
    updated_at datetime default current_timestamp
);

drop table if exists media;
create table media(
    id serial,
    media_type_id bigint unsigned not null,
    user_id bigint unsigned not null ,
    body text,
    file_name varchar(10),
    `size` int,
    metadata json,
    filename varchar(10),
    created_at datetime default now(),
    updated_at datetime default current_timestamp,

    foreign key (media_type_id) references media_type(id),
    foreign key (user_id) references users(id)
);

drop table if exists likes;
create table likes(
    id serial,
    user_id bigint unsigned not null,
    media_id bigint unsigned not null,
    created_at datetime default now(),

    foreign key (user_id) references users(id),
    foreign key (media_id) references media(id)
);

drop table if exists photo_albums;
create table photo_alums(
    id serial,
    name varchar(10),
    user_id bigint unsigned not null,

    foreign key (user_id) references users(id),
    primary key (id)
);

-- -----------------git
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

