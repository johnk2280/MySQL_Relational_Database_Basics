
-- 8. хранимые процедуры / триггеры;

-- процедура для приветствия нового пользователя
DROP PROCEDURE IF EXISTS sp_hello_user;

DELIMITER //
CREATE PROCEDURE sp_hello_user(user_name VARCHAR(100))
BEGIN
	SELECT CONCAT('Hello, ', user_name);
END//
DELIMITER ;

-- вызов процедуры
Call sp_hello_user('Vasya');


-- принимает на вход id пользователя и название города
-- и возвращает выборку подобранных вакансий для данного пользователя в указанном городе 
DROP PROCEDURE IF EXISTS sp_user_vacancies;

DELIMITER //
CREATE PROCEDURE sp_user_vacancies(user_id BIGINT, city VARCHAR(100))
BEGIN
	SELECT company_name, vacancy_name, location, expirience, skills, salary FROM hh_data WHERE to_user_id = user_id AND location = city
	UNION ALL 
	SELECT company_name, vacancy_name, location, expirience, skills, salary FROM sj_data WHERE to_user_id = user_id AND location = city
	UNION ALL
	SELECT company_name, vacancy_name, location, expirience, skills, salary FROM gj_data WHERE to_user_id = user_id AND location = city
	UNION ALL
	SELECT company_name, vacancy_name, location, expirience, skills, salary FROM hc_data WHERE to_user_id = user_id AND location = city;
END//
DELIMITER ;

-- вызов процедуры
CALL sp_user_vacancies(1, 'Москва');



-- триггер создания записи в таблице requests после добавления ключевого слова в таблицу keywords
DROP TRIGGER IF EXISTS add_request;
DELIMITER //
CREATE TRIGGER add_request AFTER INSERT ON keywords
FOR EACH ROW 
BEGIN 
	INSERT INTO `requests` (from_user_id, keyword_id, created_at)
	VALUES (NEW.from_user_id, NEW.id, NOW());
END//
DELIMITER ;


-- триггеры создания записей в таблице responses после добавления данных в таблицы _data
DROP TRIGGER IF EXISTS add_response_from_hh;
DELIMITER //
CREATE TRIGGER add_response_from_hh AFTER INSERT ON hh_data
FOR EACH ROW 
BEGIN 
	INSERT INTO responses (request_id, to_user_id, data_id, from_provider_id, created_at)
	VALUES (NEW.request_id, NEW.to_user_id, NEW.id, 1, NOW());
END//
DELIMITER ;


DROP TRIGGER IF EXISTS add_response_from_sj;
DELIMITER //
CREATE TRIGGER add_response_from_sj AFTER INSERT ON sj_data
FOR EACH ROW 
BEGIN 
	INSERT INTO responses (request_id, to_user_id, data_id, from_provider_id, created_at)
	VALUES (NEW.request_id, NEW.to_user_id, NEW.id, 2, NOW());
END//
DELIMITER ;


DROP TRIGGER IF EXISTS add_response_from_gj;
DELIMITER //
CREATE TRIGGER add_response_from_gj AFTER INSERT ON gj_data
FOR EACH ROW 
BEGIN 
	INSERT INTO responses (request_id, to_user_id, data_id, from_provider_id, created_at)
	VALUES (NEW.request_id, NEW.to_user_id, NEW.id, 3, NOW());
END//
DELIMITER ;


DROP TRIGGER IF EXISTS add_response_from_hc;
DELIMITER //
CREATE TRIGGER add_response_from_hc AFTER INSERT ON hc_data
FOR EACH ROW 
BEGIN 
	INSERT INTO responses (request_id, to_user_id, data_id, from_provider_id, created_at)
	VALUES (NEW.request_id, NEW.to_user_id, NEW.id, 4, NOW());
END//
DELIMITER ;












