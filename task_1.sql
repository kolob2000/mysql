use vk;
UPDATE friend_requests
SET target_user_id = IF(target_user_id = 50, target_user_id - 2, target_user_id + 1);
ALTER TABLE friend_requests
    ADD CHECK ( target_user_id != friend_requests.initiator_user_id );
