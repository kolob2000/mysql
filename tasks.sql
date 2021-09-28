USE vk;

-- 2.
SELECT from_user_id AS our_user, to_user_id our_companion, COUNT(to_user_id) AS message_quantity
FROM messages
GROUP BY our_user
HAVING our_user = 34;

-- 3.

SELECT COUNT(user_id) AS sum_of_likes
FROM likes
WHERE user_id IN
      (SELECT * FROM (SELECT user_id FROM profiles WHERE birthday IS NOT NULL ORDER BY birthday DESC LIMIT 10) AS t1);
-- вот это была просто жесть!!! я сорок раз писал этот запрос и мне всё
-- время  limit 10 выдавал ошибку, я снова думал и возвращался к этому варианту мне казался он самым правильным.
-- и только потом мне хватило ума скопировать ошибку, загуглить и найти, что этот лимит можно задать в производной таблице,
-- а не в условии.

-- 4.

SELECT IF(
                   (SELECT COUNT(user_id) AS sum_of_likes_female
                    FROM likes
                    WHERE user_id IN
                          (SELECT *
                           FROM (SELECT user_id FROM profiles WHERE profiles.gender = 'F') AS t1)
                   )
                   >
                   (SELECT COUNT(user_id) AS sum_of_likes_male
                    FROM likes
                    WHERE user_id IN
                          (SELECT *
                           FROM (SELECT user_id FROM profiles WHERE profiles.gender = 'M') AS t1)
                   ),
                   'Female', 'Male') AS man_or_women;

-- 5.
SELECT users.id,
       (SELECT CONCAT(firstname, ' ', lastname) FROM profiles WHERE profiles.user_id = users.id) AS 'name',
       ((SELECT COUNT(from_user_id) FROM messages WHERE from_user_id = users.id) +
        (SELECT COUNT(likes.user_id) FROM likes WHERE likes.user_id = users.id))                 AS 'activity'
FROM users
ORDER BY activity
LIMIT 10;

-- и так далее можно по аналогии складывать кроме количества лайков и сообщений  количество id инициаторов
-- из любых таблиц и выводить у кого меньше всего действий
