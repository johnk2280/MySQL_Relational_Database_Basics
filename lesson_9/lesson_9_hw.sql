-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

USE sample;

-- привожу таблицу sample.users к виду shop.users, что бы проверить корректность работы транзакции
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- проверяю список пользователей базы shop
-- в базе отсутвуюет пользователь с id=1. поэтому будем тспользовать другой id
SELECT * FROM shop.users u;

-- использую простую транзакцию без ветвлений для проверки факта корректной вставки в таблицу sample.users
START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users u WHERE id=21;
COMMIT;

SELECT * FROM users u;


-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

USE shop;

CREATE VIEW `names` AS
SELECT p.name product_name, c.name catalog_name FROM products p
JOIN catalogs c
ON p.catalog_id = c.id;

-- обращаюсь к представлению, как к таблице для проверки
SELECT * FROM `names`


-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION IF EXISTS shop.hello_func;

DELIMITER $$

CREATE FUNCTION shop.hello_func()
RETURNS VARCHAR(100) READS SQL DATA
BEGIN
    DECLARE	greeting VARCHAR(100);
	IF CURRENT_TIME() BETWEEN '6:00:01' AND '12:00:00' THEN 
		SET greeting = 'Доброе утро!';
	ELSEIF CURRENT_TIME() BETWEEN '12:00:01' AND '18:00:00' THEN 
		SET greeting = 'Добрый день!';
	ELSEIF CURRENT_TIME() BETWEEN '18:00:01' AND '00:00:00' THEN 
		SET greeting = 'Добрый вечер!';
	ELSE  
		SET greeting = 'Доброй ночи!';
	END IF;
	RETURN greeting;
END $$

DELIMITER ;


SELECT hello_func();




