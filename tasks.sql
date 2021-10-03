USE vk;

-- 1.

SELECT m.from_user_id sender, m.to_user_id recipient, count(to_user_id) message_quantity  FROM messages m
join users u
ON m.from_user_id = u.id AND u.id = 34;

-- 2.

