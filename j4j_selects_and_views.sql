-- 6. скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);
-- 7. представления (минимум 2);

USE j4j;


-- вывести количество запросов для каждого пользователя
SELECT 
	u.id, 
	u.first_name, 
	u.last_name, 
	tbl.total_count 
FROM users u
JOIN (SELECT from_user_id, COUNT(*) total_count FROM requests r GROUP BY from_user_id ) tbl
ON u.id = tbl.from_user_id
ORDER BY tbl.total_count DESC;


-- вывести количество вакансий для каждого города по всем провайдерам
SELECT 
	tbl.location, 
	COUNT(*) total_cnt 
FROM (
	SELECT hd.location FROM hh_data hd 
	UNION ALL
	SELECT sd.location FROM sj_data sd 
	UNION ALL
	SELECT gd.location FROM gj_data gd
	UNION ALL
	SELECT hd2.location FROM hc_data hd2) tbl
GROUP BY tbl.location
ORDER BY total_cnt DESC;


-- сколько вакансий получил каждый пользователь
SELECT 
	u.id,
	u.first_name,
	u.last_name,
	tbl2.requests_number,
	tbl.responses_number
FROM users u
JOIN (SELECT to_user_id, COUNT(*) responses_number FROM responses r GROUP BY to_user_id) tbl
ON u.id = tbl.to_user_id
JOIN (SELECT from_user_id, COUNT(*) requests_number FROM requests r2 GROUP BY from_user_id ) tbl2
ON u.id = tbl2.from_user_id
ORDER BY tbl2.requests_number DESC;


-- вывести количество представленных компаний по городам
SELECT 
	location,
	COUNT(company_name) cnt
FROM (
	SELECT location, company_name FROM hh_data 
	UNION ALL
	SELECT location, company_name FROM hc_data 
	UNION ALL
	SELECT location, company_name FROM sj_data 
	UNION ALL
	SELECT location, company_name FROM gj_data ) tbl
GROUP BY location
ORDER BY cnt DESC;


-- вывести количество вакансий по опыту работы
SELECT 
	expirience, 
	COUNT(*) cnt
FROM (
	SELECT expirience FROM hh_data
	UNION ALL
	SELECT expirience FROM sj_data
	UNION ALL
	SELECT expirience FROM gj_data
	UNION ALL
	SELECT expirience FROM hc_data) tbl
GROUP BY expirience
ORDER BY cnt DESC;


-- выбираем количество ответов на каждый запрос
SELECT request_id, COUNT(*) FROM responses r GROUP BY request_id;


-- представление, которое выводит все вакансии на все запросы
DROP VIEW IF EXISTS vacancy_tbl;
CREATE VIEW vacancy_tbl AS
SELECT u.first_name, u.last_name, tbl4.company_name, tbl4.vacancy_name, tbl4.location, tbl4.expirience, tbl4.skills, tbl4.salary FROM users u
JOIN (  SELECT to_user_id, company_name, vacancy_name, location, expirience, skills, salary FROM hh_data
		UNION
		SELECT to_user_id, company_name, vacancy_name, location, expirience, skills, salary FROM sj_data
		UNION
		SELECT to_user_id, company_name, vacancy_name, location, expirience, skills, salary FROM gj_data
		UNION
		SELECT to_user_id, company_name, vacancy_name, location, expirience, skills, salary FROM hc_data) tbl4
ON u.id = tbl4.to_user_id;

-- вызываю представление
SELECT * FROM vacancy_tbl;


-- представление выводит количество городов в котором размещены вакансии комппании
DROP VIEW IF EXISTS company_vacancies;
CREATE VIEW company_vacancies AS
	SELECT 
		company_name, 
		COUNT(location) number_of_cities 
	FROM (
		SELECT company_name, location FROM hh_data
		UNION ALL
		SELECT company_name, location FROM sj_data
		UNION ALL
		SELECT company_name, location FROM gj_data
		UNION ALL
		SELECT company_name, location FROM hc_data) tbl5
	GROUP BY company_name 
	ORDER BY number_of_cities DESC;

SELECT * FROM company_vacancies;


