-- 1) Создайте таблицу logs типа Archive. 
-- Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
-- название таблицы, идентификатор первичного ключа и содержимое поля name.

USE shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(255) NOT NULL,
	key_id INT NOT NULL,
	name_content VARCHAR(100)
) ENGINE=Archive;

DROP TRIGGER IF EXISTS users_add;
DELIMITER //
CREATE TRIGGER users_add AFTER INSERT ON users
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (created_at, table_name, key_id, name_content)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END//
DELIMITER ;

DROP TRIGGER IF EXISTS catalogs_add;
DELIMITER //
CREATE TRIGGER catalogs_add AFTER INSERT ON catalogs
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (created_at, table_name, key_id, name_content)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END//
DELIMITER ;

DROP TRIGGER IF EXISTS products_add;
DELIMITER //
CREATE TRIGGER products_add AFTER INSERT ON products
FOR EACH ROW 
BEGIN 
	INSERT INTO logs (created_at, table_name, key_id, name_content)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END//
DELIMITER ;

-- проверяю работу тригеров
INSERT INTO users (name, birthday_at)
VALUES ('Василий', '1990-10-05');

INSERT INTO catalogs (name)
VALUES ('Периферия периферии');

INSERT INTO products (name, catalog_id)
VALUES ('правая кнопка NONAME мыши', 6);


-- 2) Создайте SQL-запрос, который помещает в таблицу users миллион записей.


-- создаю процедуру увеличения количества записей до 1 000 000
DELIMITER $$
$$
CREATE PROCEDURE shop.p_increase_users ()
BEGIN
	DECLARE i BIGINT DEFAULT 0;
	cycle: LOOP
		DROP VIEW IF EXISTS `names`;
		CREATE VIEW `names` AS
		SELECT u1.* FROM users u1 JOIN users u2;
	
		INSERT INTO users(name) SELECT name FROM `names`;
	
		SET i = (SELECT COUNT(*) FROM users);
	
		IF i >= 1000000 THEN LEAVE cycle;
		END IF;
	
	END LOOP cycle;
		
END $$
DELIMITER ;


-- проверяю, имеюются ли записи в таблице, если нет, то вставляю инсертом, сколько не жалко
SELECT * FROM users u;

-- вызываем процедуру
CALL shop.p_increase_users ();


-- проверяем количество записей
SELECT COUNT(*) FROM shop.users u 






