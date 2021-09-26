use vk;

-- 2.
SELECT from_user_id as our_user,  to_user_id our_companion, count(to_user_id) as message_quantity FROM messages GROUP BY our_user HAVING our_user = 34;

