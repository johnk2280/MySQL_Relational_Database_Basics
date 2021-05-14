/*
Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
*/

-- проверяю поля created_at, updated_at

SELECT id, name, birthday_at, created_at, updated_at
FROM shop.users;

-- т.к. поля оказались заполненными обNULLяю поля created_at, updated_at
UPDATE users
SET
	created_at = NULL,
	updated_at = NULL
WHERE created_at IS NOT NULL OR updated_at IS NOT NULL;

-- обновляю поля согласно условиям задачи
UPDATE users
SET
	created_at = NOW() ,
	updated_at = NOW() 
WHERE created_at IS NULL OR updated_at IS NULL;


/*
**********************************************************************************************
Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/

-- так как столбцы изначально были заполнены, то приводим тип столбцов к условиям задачи

ALTER TABLE users MODIFY created_at VARCHAR(255);
ALTER TABLE users MODIFY updated_at VARCHAR(255);

UPDATE users 
SET
	created_at = '2021-02-08 19:40:08',
	updated_at = '2021-02-08 19:40:08';


-- модифицируем из VARCHAR в DATETIME

ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;



/*
**********************************************************************************************
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако нулевые запасы должны выводиться в конце, после всех записей.
*/

-- проверяем заполненность таблицы

SELECT id, storehouse_id, product_id, value, created_at, updated_at FROM storehouses_products;

-- т.к. таблица не заполнена. добавляем данные

INSERT IGNORE storehouses_products (product_id, value, created_at, updated_at)
VALUES
(1, 10, NOW(), NOW()),
(2, 0, NOW(), NOW()),
(3, 110, NOW(), NOW()),
(4, 7, NOW(), NOW()),
(5, 0, NOW(), NOW()),
(6, 3, NOW(), NOW()),
(7, 14, NOW(), NOW());


-- делаем выборку по условиям задачи

SELECT 
	id, 
	storehouse_id, 
	product_id, 
	value, 
	created_at, 
	updated_at 
FROM storehouses_products 
ORDER BY IF(value > 0, 0, 1), value;


/*
**********************************************************************************************
(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий (may, august)
*/

SELECT 
	id,
	name,
	birthday_at
FROM users
WHERE MONTH(birthday_at) IN (5, 8);



/*
**********************************************************************************************
(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
Отсортируйте записи в порядке, заданном в списке IN.
*/


SELECT 
	id,
	name 
FROM catalogs 
WHERE id IN (5, 1, 2)
ORDER BY FIELD(id, 5, 1, 2);


/*
**********************************************************************************************
Подсчитайте средний возраст пользователей в таблице users.
*/

SELECT
	ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 0) AS average_age 
FROM users;


/*
**********************************************************************************************
Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

SELECT
	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS `day`,
	COUNT(*) AS total
FROM
	users
GROUP BY
	`day`
ORDER BY
	total DESC;

/*
**********************************************************************************************
(по желанию) Подсчитайте произведение чисел в столбце таблицы.
*/


SELECT ROUND(exp(SUM(ln(price / 1000))), 0) AS factorial FROM products;
































