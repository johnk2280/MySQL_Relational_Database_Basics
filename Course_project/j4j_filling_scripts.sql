-- 5. скрипты наполнения БД данными;

USE j4j;


-- заполнение таблицы users 
INSERT IGNORE INTO users (first_name, last_name, telegram_id)
VALUES 
	('Reuben', 'Nienow', 934876715),
 	('Frederik', 'Upton', 735030221),
	('Unique', 'Windler', 762345757);


-- заполнение таблицы providers
INSERT INTO providers (name)
VALUES
	('Head Hunter'),
	('Super Job'),
	('Geek Job'),
	('Habr Career');


-- заполнение таблицы keywords
INSERT INTO keywords (from_user_id, keyword, created_at)
VALUES
	(1, 'Python Developer', NOW()),
	(2, 'Python', NOW()),
	(3, 'Python разработчик', NOW());


-- вставка ответов пользователю с id = 1
INSERT INTO hh_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(1, 1, '1 февраля 2021', 'Playrix', 'Python Developer (Программист Python)', 'Санкт-Петербург', 'Средний (Middle)', 'Бэкенд, Python, SQL', 'По договоренности', 'https://career.habr.com/vacancies/1000069468'),
	(1, 1, '15 февраля 2021',	'U-System', 'Программист Python / python developer', 'Воронеж',	'Средний (Middle)',	'Разработка ПО, Python', 'от 100 000 до 140 000 ₽', 'https://career.habr.com/vacancies/1000069468'),
	(1, 1, '10 февраля 2021',	'AGORA', 'Python разработчик', 'Санкт-Петербург',	'Средний (Middle)',	'Бэкенд, Python, Django', 'от 80 000 до 140 000 ₽', 'https://career.habr.com/vacancies/1000069468'),
	(1, 1, '28 января 2021', 'Playrix', 'Senior Python Developer / (Ведущий разработчик на Python)', 'Казань', 'Senior', 'Python Бэкенд SQL',	'По договоренности', 'https://career.habr.com/vacancies/1000069468'),
	(1, 1, '2 февраля 2021', 'BostonGene', 'Senior/Lead Python Developer', 'Москва', 'Старший (Senior)', 'Бэкенд Python',	'По договоренности', 'https://career.habr.com/vacancies/1000069675'),
	(1, 1, '19 января 2021', 'ГК «Самолет»', 'Ведущий разработчик python', 'Казань', 'Ведущий (Lead)', 	'Бэкенд Python', 'По договоренности', 'https://career.habr.com/vacancies/1000068875'),
	(1, 1, '10 февраля 2021', 'Территория Роста', 'Разработчик (на языке Python)', 'Оренбург', 'Младший (Junior)', 'Бэкенд Python', 'от 40 000 до 120 000 ₽', 'https://career.habr.com/vacancies/1000069045'),
	(1, 1, '9 февраля 2021', 'Онлайн-кинотеатр ivi', 'Python-разработчик', 'Москва', 'Junior', 'Python Бэкенд SQL Django Linux', 'По договоренности', 'https://career.habr.com/vacancies/1000070111'),
	(1, 1, '22 февраля 2021', 'Group-IB', 'Программист Python', 'Москва', 'Средний (Middle)', 'Бэкенд Python Flask PostgreSQL', 'По договоренности', 'https://career.habr.com/vacancies/1000069643');


INSERT INTO sj_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(1, 1, '2 февраля 2021', 'Яндекс.Практикум', 'Бэкенд-разработчик (Python)', 'Санкт-Петербург', 'Средний (Middle)', 'Бэкенд Python SQL Docker', 'По договоренности', 'https://career.habr.com/vacancies/1000069664'),
	(1, 1, '10 февраля 2021', 'Латера', 'Python-разработчик (Middle)', 'Санкт-Петербург', 'Средний (Middle)', 'Телеком Python PostgreSQL Linux Docker', 'До 220 000 ₽', 'https://career.habr.com/vacancies/1000069003'),
	(1, 1, '5 февраля 2021', 'NUTSon', 'Python Backend Developer', 'Москва', 'Старший (Senior)', 'Бэкенд Python MongoDB FastAPI', 'от 180 000 ₽', 'https://career.habr.com/vacancies/1000069917'),
	(1, 1, '16 февраля 2021', 'TINKOFF', 'Python Data Engineer', 'Ростов-на-Дону', 'Средний (Middle)', 'Бэкенд Python Numpy Apache Airflow PostgreSQL', 'По договоренности', 'https://career.habr.com/vacancies/1000064485'),
	(1, 1, '15 февраля 2021', 'Artezio', 'Senior Python разработчик', 'Санкт-Петербург', 'Старший (Senior)', 'Бэкенд Python SQL Django Docker Kafka Машинное обучение',	'от 200 000 ₽', 'https://career.habr.com/vacancies/1000067949'),
	(1, 1, '12 февраля 2021', 'trunkdev', 'Разработчик Python/Django + React.js', 'Санкт-Петербург', 'Средний (Middle)', 'Бэкенд Python Django JavaScript ReactJS', 'от 130 000 до 170 000 ₽', 'https://career.habr.com/vacancies/1000070358'),
	(1, 1, '3 февраля 2021', 'JetStyle', 'Python-разработчик', 'Екатеринбург', 'Senior Python', 'Бэкенд Django Flask Elasticsearch Redis Rabbitmq Celery Gitlab Docker Linux Nginx Bash', 'от 60 000 ₽', 'https://career.habr.com/vacancies/1000063768');


INSERT INTO gj_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(1, 1, '16 февраля 2021', 'Пульс Продаж Новостроек', 'Разработчик Python/Django + Vue.js', 'Москва', 'Средний (Middle)', 'Разработка ПО Python Django JavaScript Vue.js', 'от 80 000 до 180 000 ₽', 'https://career.habr.com/vacancies/1000070557'),
	(1, 1, '13 февраля 2021', 'DOT.Agency', 'Python developer', 'Москва', 'Средний (Middle)', 'Бэкенд Python Django Flask Tornado web server aiohttp Selenium', 'от 1 200 до 2 500 $', 'https://career.habr.com/vacancies/1000069741'),
	(1, 1, '8 февраля 2021', 'Coding Team', 'Python разработчик (Middle/Senior)', 'Москва', 'Средний (Middle)', 'Бэкенд Python PostgreSQL Rabbitmq Git Vue.js Node.js', 'от 100 000 до 220 000 ₽', 'https://career.habr.com/vacancies/1000067597');


INSERT INTO hc_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(1, 1, '15 февраля 2021', 'Group-IB', 'Программист Python', 'Москва', 'Средний (Middle)', 'Бэкенд, Python, Flask, PostgreSQL', 'По договоренности', 'https://career.habr.com/vacancies/1000069643'),
	(1, 1, '1 февраля 2021', 'YLab', 'Программист Python', 'Санкт-Петербург', 'Средний (Middle)', 'Бэкенд, Python, Django, Git, Flask, Celery', 'До 200 000 ₽', 'https://career.habr.com/vacancies/1000064947'),
	(1, 1, '11 февраля 2021', 'Mircod', 'Python разработчик', 'Казань', 'Средний (Middle)', 'Бэкенд, Python, Django, Docker, MongoDB, JavaScript, ООП', 'от 80 000 ₽', 'https://career.habr.com/vacancies/1000069161'),
	(1, 1, '5 февраля 2021', 'Ak Bars Digital Technologies', 'Python Developer', 'Санкт-Петербург', 'Средний (Middle)', 'Бэкенд, Python, MongoDB, MySQL, PostgreSQL, FastAPI', 'По договоренности', 'https://career.habr.com/vacancies/1000069940'),
	(1, 1, '4 февраля 2021', 'SimbirSoft', 'Python - разработчик', 'Казань', 'Средний (Middle)', 'Бэкенд, Python, Django, Docker, Celery, Rabbitmq', 'По договоренности', 'https://career.habr.com/vacancies/1000049941');



-- вставка ответов пользователю с id = 2
INSERT INTO hh_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(2, 2, '10 февраля 2021', 'Интеллектуальная транспортная система', 'Python-разработчик Pre Middle / Middle', 'Тюмень', 'Средний (Middle)', 'Бэкенд Python Django ООП SQL Git', 'от 60 000 до 120 000 ₽', 'https://career.habr.com/vacancies/1000070222'), 
	(2, 2, '16 февраля 2021', 'PricePlan', 'Python-разработчик на удалёнку', 'Москва', 'Средний (Middle)', 'Бэкенд Python Django ReactJS Кроссбраузерная верстка', '150 000 до 150 000 ₽', 'https://career.habr.com/vacancies/1000070015'),
	(2, 2, '22 января 2021', 'Railsware', 'Full stack Engineer (Python / JS)', 'Москва', 'Старший (Senior)', 'Разработка ПО Python JavaScript', 'По договоренности', 'https://career.habr.com/vacancies/1000069183');


INSERT INTO sj_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(2, 2, '18 января 2021', 'Gaijin Entertainment', 'Билд-инженер/Программист Python (Continuous Integration)', 'Москва', 'Средний (Middle)', 'Бэкенд Python C++', 'По договоренности', 'https://career.habr.com/vacancies/1000063259'),
	(2, 2, '8 февраля 2021', 'Prisma Labs', 'Data Engineer (Python)', 	'Москва', 'Старший (Senior)', 'Разработка ПО Python SQL Api интерфейсы Git MongoDB Amazon AWS', 'По договоренности', 'https://career.habr.com/vacancies/1000066810'),
	(2, 2, '29 января 2021', 'Top-executive', 'Senior developer/Tech lead backend Python', 'Москва', 'Ведущий (Lead)', 'Бэкенд Python', 'от 300 000 ₽', 'https://career.habr.com/vacancies/1000069548');


INSERT INTO gj_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(2, 2, '25 января 2021', 'Timeweb', 'Backend Python разработчик', 'Санкт-Петербург', 'Средний (Middle)', 'Бэкенд Python Flask MySQL Docker Kubernetes Rabbitmq Linux Nginx Redis', 'от 130 000 ₽', 'https://career.habr.com/vacancies/1000069284'),
	(2, 2, '11 февраля 2021', 'Spark Equation', 'Senior Python Engineer (remote)', 'Москва', 'Старший (Senior)', 'Бэкенд Python Flask JavaScript PostgreSQL ReactJS SQL Nosql Git Архитектура по', 'от 200 000 ₽', 'https://career.habr.com/vacancies/1000059452'),
	(2, 2, '10 февраля 2021', 'Brandquad', 'Backend-разработчик \ Middle Python', 'Москва', 'Средний (Middle)', 'Бэкенд Python Django aiohttp PostgreSQL Linux Docker Rabbitmq Redis Elasticsearch Celery', 'По договоренности', 'https://career.habr.com/vacancies/1000065714');


INSERT INTO hc_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(2, 2, '25 января 2021', 'REG.RU', 'Старший программист-аналитик Python', 'Москва', 'Старший (Senior)', 'Другое Python MySQL SQL Linux Docker Numpy Математическая статистика Математическое моделирование', 'от 170 000 ₽', 'https://career.habr.com/vacancies/1000069243'),
	(2, 2, '11 февраля 2021', 'AgentApp', 'Backend Developer (Python/GO)', 'Москва', 'Старший (Senior)', 'Бэкенд Python Jenkins Gitlab CI/CD methodologies Асинхронное программирование TDD / BDD', 'от 180 000 ₽', 'https://career.habr.com/vacancies/1000070293'),
	(2, 2, '14 февраля 2021', 'Mail.ru Group', 'Python-разработчик в департамент бизнес-процессов', 'Москва', 'Senior Python', 'Бэкенд', 'По договоренности', 'https://career.habr.com/vacancies/1000068757');


-- вставка ответов пользователю с id = 3
INSERT INTO hh_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(3, 3, '13 февраля 2021', 'TIQUM', 'Python-разработчик (Middle)', 'Уфа', 'Средний (Middle)', 'Бэкенд Python Django Русский язык Грамотность Разработка креативных стратегий коммуникаций', 'По договоренности', 'https://career.habr.com/vacancies/1000068261'),
	(3, 3, '12 февраля 2021', 'Fabrique', 'Python-разработчик (Django, DRF)', 'Москва', 'Средний (Middle)', 'Бэкенд Python Django Restful webservices PostgreSQL SQL Docker Rabbitmq Git', 'от 60 000 до 150 000 ₽', 'https://career.habr.com/vacancies/1000059820'),
	(3, 3, '7 февраля 2021', 'Kavkaz Express LLC', 'Backend Developer (Python/Django)', 'Москва', 'Старший (Senior)', 'Бэкенд Django Python Git PostgreSQL Nginx Bash Docker Celery Restful api', 'от 150 000 до 250 000 ₽', 'https://career.habr.com/vacancies/1000068492');


INSERT INTO sj_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(3, 3, '12 февраля 2021', 'Fabrique', 'Стажёр Python-разработчик (Django, DRF)', 'Москва', 'Стажёр (Intern)', 'Разработка ПО Python Django PostgreSQL SQL Rabbitmq CSS', 'от 50 000 до 90 000 ₽', 'https://career.habr.com/vacancies/1000065475'),
	(3, 3, '11 февраля 2021', 'Artezio', 'Senior Python разработчик', 'Минск', 'Старший (Senior)', 'Бэкенд Python SQL Django Docker Kafka Машинное обучение', 'от 2 700 $', 'https://career.habr.com/vacancies/1000068578'),
	(3, 3, '15 февраля 2021', 'Artezio', 'Senior Python разработчик', 'Нижний Новгород', 'Старший (Senior)', 'Бэкенд Python SQL Django Docker Kafka Машинное обучение', 'от 200 000 ₽', 'https://career.habr.com/vacancies/1000067948');


INSERT INTO gj_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(3, 3, '18 января 2021', 'OKPixels', 'Python Developer Middle/Senior (Удаленно)', 'Москва', 'Средний (Middle)', 'Бэкенд Python PostgreSQL Redis Flask', 'По договоренности', 'https://career.habr.com/vacancies/1000068899'),
	(3, 3, '16 февраля 2021', 'TINKOFF', 'Data Engineer (Python)', 'Краснодар', 'Средний (Middle)', 'Бэкенд SQL Python ООП Java Базы данных', 'По договоренности', 'https://career.habr.com/vacancies/1000069329'),
	(3, 3, '12 февраля 2021', 'Декаст Инжиниринг', 'Python Backend Developer', 'Москва', 'Средний (Middle)', 'Бэкенд Django Python Docker Git Rest Linux Celery', 'от 150 000 до 250 000 ₽', 'https://career.habr.com/vacancies/1000046197');
	

INSERT INTO hc_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(3, 3, '11 февраля 2021', 'Nitka Technologies Inc.', 'Python Developer/Data Scientist (remote)', 'Москва', 'Старший (Senior)', 'Разработка ПО Python Алгоритмы и структуры данных Английский язык', 'По договоренности', 'https://career.habr.com/vacancies/1000069874'),
	(3, 3, '20 января 2021', 'Inelso', 'Бэкенд разработчик Python/Django/Oscar', 'Москва', 'Старший (Senior)', 'Бэкенд Python Django Linux PostgreSQL Solr Celery', 'от 150 000 до 200 000 ₽', 'https://career.habr.com/vacancies/1000063506'),
	(3, 3, '30 декабря 2020', 'SberMarket', 'Back-end Developer Go/Python', 'Москва', 'Старший (Senior)', 'Бэкенд Python Golang PostgreSQL MySQL Redis Django', 'По договоренности', 'https://career.habr.com/vacancies/1000067140');


-- еще один запрос от пользователя с id = 2
INSERT INTO keywords (from_user_id, keyword, created_at)
VALUES (2, 'Python разработчик', NOW());

-- вставка ответов пользователю с id = 2
INSERT INTO hh_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(4, 2, '27 января 2021', 'Garpix', 'Python разработчик (Middle и выше)', 'Иваново', 'Средний (Middle)', 'Бэкенд PostgreSQL Django Python Docker Redis ООП Git', 'от 40 000 до 120 000 ₽', 'https://career.habr.com/vacancies/1000069446'),
	(4, 2, '15 февраля 2021', 'Artezio', 'Python разработчик (медицинский проект из Англии)', 'Нижний Новгород', 'Старший (Senior)', 'Бэкенд Python Flask Sqlalchemy PostgreSQL', 'от 140 000 ₽', 'https://career.habr.com/vacancies/1000069974'),
	(4, 2, '15 февраля 2021', 'Artezio', 'Python разработчик (медицинский проект из Англии)', 'Минск', 'Старший (Senior)', 'Бэкенд Python Flask Sqlalchemy PostgreSQL', 'от 2 000 $', 'https://career.habr.com/vacancies/1000069979');

INSERT INTO sj_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(4, 2, '10 февраля 2021', 'Exness', 'Senior Python Developer (Gatech, remotely or relocation)', 'Москва', 	'Старший (Senior)', 'Бэкенд Python asyncio Docker', 'от 3 000 €', 'https://career.habr.com/vacancies/1000068756'),
	(4, 2, '15 февраля 2021', 'Artezio', 'Python разработчик (медицинский проект из Англии)', 'Санкт-Петербург', 'Старший (Senior)', 'Бэкенд Python Flask Sqlalchemy PostgreSQL', 'от 140 000 ₽', 'https://career.habr.com/vacancies/1000069977'),
	(4, 2, '15 февраля 2021', 'Artezio', 'Python разработчик (медицинский проект из Англии)', 'Саратов', 'Старший (Senior)', 'Бэкенд Python Flask Sqlalchemy PostgreSQL', 'от 140 000 ₽', 'https://career.habr.com/vacancies/1000069976');
	
INSERT INTO gj_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(4, 2, '15 февраля', 	'Artezio', 'Python разработчик (медицинский проект из Англии)', 'Могилев', 'Старший (Senior)', 'Бэкенд Python Flask Sqlalchemy PostgreSQL', 'от 2 000 $', 'https://career.habr.com/vacancies/1000069981'),
	(4, 2, '5 февраля 2021', 'MediaSoft', 'Middle / Senior Backend developer (Python/Go)', 'Санкт-Петербург', 'Средний (Middle)', 'Бэкенд Python Golang', 'от 80 000 до 150 000 ₽', 'https://career.habr.com/vacancies/1000064614'),
	(4, 2, '9 февраля 2021', 'Portal Bilet', 'Python Developer Middle', 'Москва', 'Средний (Middle)', 'Бэкенд Python Django PostgreSQL ООП Git Docker Linux Redis asyncio Celery', 'от 150 000 ₽', 'https://career.habr.com/vacancies/1000059865');

INSERT INTO hc_data (request_id, to_user_id, job_creation_date, company_name, vacancy_name, location, expirience, skills, salary, vacancy_url)
VALUES
	(4, 2, '15 февраля 2021', 'VESTA', 'Web-разработчик (full stack, python, js)', 'Москва', 'Средний (Middle)', 'Бэкенд Python MySQL MongoDB Docker Unix', 'По договоренности', 'https://career.habr.com/vacancies/1000068090'),
	(4, 2, '12 февраля 2021', 'RocketData', 'Senior Python Developer(удаленка)', 'Москва', 'Старший (Senior)', 'Бэкенд Python Django MongoDB PostgreSQL Redis Nginx FastAPI Docker Linux Git', 'от 250 000 до 370 000 ₽', 'https://career.habr.com/vacancies/1000068597'),
	(4, 2, '25 января 2021', 'REG.RU', 'Senior python-разработчик', 'Москва', 'Старший (Senior)', 'Бэкенд Python Django Flask SQL Git Linux MySQL Docker', 'от 170 000 ₽', 'https://career.habr.com/vacancies/1000069242');


	























