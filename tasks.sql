USE vk;

-- 1.

SELECT count(to_user_id), m.to_user_id, m.from_user_id FROM messages m
join users u
ON m.from_user_id = u.id AND u.id = 34;

-- 2.

