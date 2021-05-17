-- Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT * FROM users;

-- при решении задачи выбрал пользователя с id = 1
-- проверяю кто является для него другом
SELECT * FROM friend_requests WHERE (initiator_user_id = 1 OR target_user_id = 1) AND status = 'approved';

-- решил увеличить количесво друзей пользователя с id=1, что бы было из кого выбирать
-- новым другом выбрал пользователя с id=8 и обновил все связи
UPDATE friend_requests
SET 
	target_user_id = 1
WHERE initiator_user_id = 8 AND target_user_id = 6;

UPDATE friend_requests
SET 
	status = 'approved'
WHERE initiator_user_id = 8 AND target_user_id = 1;

-- далее делаем выборку

SELECT 
	from_user_id,
	COUNT(from_user_id) AS cnt
	FROM messages
	WHERE
		from_user_id IN (
			SELECT initiator_user_id FROM friend_requests WHERE (initiator_user_id = 1 OR target_user_id = 1) AND status = 'approved'
			UNION
			SELECT target_user_id  FROM friend_requests WHERE (initiator_user_id = 1 OR target_user_id = 1) AND status = 'approved'
			) 
			AND to_user_id = 1
GROUP BY from_user_id 
ORDER BY cnt DESC LIMIT 1;
	

-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

SELECT 
COUNT(*) as total_likes 
FROM likes 
WHERE user_id IN (
	SELECT user_id FROM profiles WHERE TIMESTAMPDIFF(YEAR, birthday, NOW())  < 10
);


-- Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT 
	COUNT(*) as total_likes, 
	(SELECT gender FROM profiles WHERE gender = 'f' GROUP BY gender ) as gender 
FROM likes
WHERE user_id in (
	SELECT user_id FROM profiles WHERE gender = 'f'
)
UNION 
SELECT 
	COUNT(*) as total_likes, 
	(SELECT gender FROM profiles WHERE gender = 'm' GROUP BY gender) as gender
FROM likes
WHERE user_id in (
	SELECT user_id FROM profiles WHERE gender = 'm'
)
ORDER BY total_likes
DESC LIMIT 1;
















