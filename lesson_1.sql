drop database if exists example;
create database if not exists example;
use example;
drop table if exists users;
create table if not exists users(
    id serial primary key,
    name varchar(255) default 'anonymous'
);

