USE vk;
SELECT ALL to_user_id, from_user_id, COUNT(from_user_id)
FROM messages
WHERE to_user_id = 8
GROUP BY from_user_id;

SELECT CONCAT(u.firstname, ' ', u.lastname) AS `to`,
       m.from_user_id
FROM users u

         INNER JOIN messages m ON u.id = m.to_user_id;


SELECT *
FROM messages;
DROP TABLE t1;
CREATE TABLE t1
(
    id  SERIAL PRIMARY KEY ,
    val VARCHAR(50)
);
DROP TABLE t2;
CREATE TABLE t2
(
    t1_id BIGINT UNSIGNED NOT NULL ,
    val   VARCHAR(50),
    FOREIGN KEY(t1_id) REFERENCES t1(id)
);

INSERT INTO t1 VALUES (1, 'hello'), (2, 'goodbye'), (3, 'good arternoon');
INSERT INTO t2 VALUES (1, 'lo'), (2, 'bye'), (3, 'go');

SELECT * FROM t1 right join t2 ON t1.id = t2.t1_id;