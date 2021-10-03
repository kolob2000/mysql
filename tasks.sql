USE vk;

-- 1.

SELECT m.from_user_id sender, m.to_user_id recipient, COUNT(to_user_id) message_quantity
FROM messages m
         JOIN users u
              ON m.from_user_id = u.id AND u.id = 34;

-- 2.

SELECT COUNT(likes.user_id) AS sum_of_likes
FROM likes
         JOIN (SELECT *
               FROM profiles
               WHERE birthday IS NOT NULL
                 AND (TIMESTAMPDIFF(YEAR, birthday, CURDATE()) < 10)
                 AND TIMESTAMPDIFF(YEAR, birthday, CURDATE()) > 0) p
              ON p.user_id = likes.user_id;

