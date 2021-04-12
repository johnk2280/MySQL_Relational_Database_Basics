/* База данных j4j к телеграм-боту для поиска работы в ИТ для junior.
 * 
 * БД заполняется из парсеров сайтов Head-Hunter, SuperJob, GeekJob, Хабр Карьера.
 * БД необходима для хранения данных пользователей, запросов по ключевым словам, ответов на запросы от поставщиков данных.
 * Все это необходимо для сбора статистики и проведения анализа.
*/



DROP DATABASE IF EXISTS j4j;
CREATE DATABASE j4j;

USE j4j;


-- таблица users
-- данные о пользователе получаем из телеграм-бота

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) COMMENT 'имя',
	last_name VARCHAR(100) COMMENT 'фамилия',
	telegram_id BIGINT UNSIGNED COMMENT 'id из telegram',
	INDEX users_firstname_lastname_idx(first_name, last_name)
);


-- таблица ключевых слов
DROP TABLE IF EXISTS `keywords`;
CREATE TABLE `keywords`(
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL COMMENT 'от кого',
	keyword VARCHAR(255) COMMENT 'текст ключевого слова',
	created_at DATETIME DEFAULT NOW() COMMENT 'дата создания записи',
	FOREIGN KEY (from_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- таблица самих запросов
DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests`(
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL COMMENT 'от кого',
	keyword_id BIGINT UNSIGNED NOT NULL COMMENT 'id ключевого слова',
	created_at DATETIME DEFAULT NOW() COMMENT 'дата создания записи',
	FOREIGN KEY (from_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (keyword_id) REFERENCES keywords(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- таблица с указанием поставщиков данных
DROP TABLE IF EXISTS providers;
CREATE TABLE providers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) COMMENT 'наименование поставщика данных'
);



-- таблица ответов
DROP TABLE IF EXISTS `responses`;
CREATE TABLE `responses` (
	id SERIAL PRIMARY KEY,
	request_id BIGINT UNSIGNED NOT NULL COMMENT 'id зароса',
	to_user_id BIGINT UNSIGNED NOT NULL COMMENT 'кому',
	data_id BIGINT UNSIGNED COMMENT 'id записи в таблицах  __data',
	from_provider_id BIGINT UNSIGNED NOT NULL COMMENT 'id поставщика данных',
	created_at DATETIME DEFAULT NOW() COMMENT 'дата создания записи',
	FOREIGN KEY (request_id) REFERENCES `requests`(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (from_provider_id) REFERENCES providers(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- поставщик данных Head-Hunter
DROP TABLE IF EXISTS hh_data;
CREATE TABLE hh_data (
	id SERIAL PRIMARY KEY,
	request_id BIGINT UNSIGNED NOT NULL COMMENT 'id зароса',
	to_user_id BIGINT UNSIGNED NOT NULL COMMENT 'кому',
	job_creation_date VARCHAR(100) COMMENT 'дата создания вакансии на сайте',
	company_name VARCHAR(255) COMMENT 'наименование компании',
	vacancy_name VARCHAR(255) COMMENT 'наименование вакансии',
	location VARCHAR(255) COMMENT 'локация вакансии',
	expirience VARCHAR(100) COMMENT 'требуемый опыт работы',
	skills VARCHAR(255) COMMENT 'навыки',
	salary VARCHAR(100)COMMENT 'оклад',
	vacancy_url TEXT COMMENT 'сслыка на вакансию на сайте поставщика',
	created_at DATETIME DEFAULT NOW() COMMENT 'дата создания записи',
	FOREIGN KEY (request_id) REFERENCES `requests`(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- поставщик данных SuperJob
DROP TABLE IF EXISTS sj_data;
CREATE TABLE sj_data (
	id SERIAL PRIMARY KEY,
	request_id BIGINT UNSIGNED NOT NULL COMMENT 'id зароса',
	to_user_id BIGINT UNSIGNED NOT NULL COMMENT 'кому',
	job_creation_date VARCHAR(100) COMMENT 'дата создания вакансии на сайте',
	company_name VARCHAR(255) COMMENT 'наименование компании',
	vacancy_name VARCHAR(255) COMMENT 'наименование вакансии',
	location VARCHAR(255) COMMENT 'локация вакансии',
	expirience VARCHAR(100) COMMENT 'требуемый опыт работы',
	skills VARCHAR(255) COMMENT 'навыки',
	salary VARCHAR(100)COMMENT 'оклад',
	vacancy_url TEXT COMMENT 'сслыка на вакансию на сайте поставщика',
	created_at DATETIME DEFAULT NOW() COMMENT 'дата создания записи',
	FOREIGN KEY (request_id) REFERENCES `requests`(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- поставщик данных Хабр Карьера
DROP TABLE IF EXISTS hc_data;
CREATE TABLE hc_data (
	id SERIAL PRIMARY KEY,
	request_id BIGINT UNSIGNED NOT NULL COMMENT 'id зароса',
	to_user_id BIGINT UNSIGNED NOT NULL COMMENT 'кому',
	job_creation_date VARCHAR(100) COMMENT 'дата создания вакансии на сайте',
	company_name VARCHAR(255) COMMENT 'наименование компании',
	vacancy_name VARCHAR(255) COMMENT 'наименование вакансии',
	location VARCHAR(255) COMMENT 'локация вакансии',
	expirience VARCHAR(100) COMMENT 'требуемый опыт работы',
	skills VARCHAR(255) COMMENT 'навыки',
	salary VARCHAR(100)COMMENT 'оклад',
	vacancy_url TEXT COMMENT 'сслыка на вакансию на сайте поставщика',
	created_at DATETIME DEFAULT NOW() COMMENT 'дата создания записи',
	FOREIGN KEY (request_id) REFERENCES `requests`(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- поставщик данных Geek Job
DROP TABLE IF EXISTS gj_data;
CREATE TABLE gj_data (
	id SERIAL PRIMARY KEY,
	request_id BIGINT UNSIGNED NOT NULL COMMENT 'id зароса',
	to_user_id BIGINT UNSIGNED NOT NULL COMMENT 'кому',
	job_creation_date VARCHAR(100) COMMENT 'дата создания вакансии на сайте',
	company_name VARCHAR(255) COMMENT 'наименование компании',
	vacancy_name VARCHAR(255) COMMENT 'наименование вакансии',
	location VARCHAR(255) COMMENT 'локация вакансии',
	expirience VARCHAR(100) COMMENT 'требуемый опыт работы',
	skills VARCHAR(255) COMMENT 'навыки',
	salary VARCHAR(100)COMMENT 'оклад',
	vacancy_url TEXT COMMENT 'сслыка на вакансию на сайте поставщика',
	created_at DATETIME DEFAULT NOW() COMMENT 'дата создания записи',
	FOREIGN KEY (request_id) REFERENCES `requests`(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (to_user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);








