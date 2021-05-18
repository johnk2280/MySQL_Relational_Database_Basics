-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

-- немного наполню таблицу для красоты эксперемента
INSERT INTO orders (user_id, created_at , updated_at)
VALUES
(21, NOW(), NOW()),
(26, NOW(), NOW());


-- выборка по условиям задачи
SELECT
id,
name
FROM users u
WHERE id IN (SELECT user_id FROM orders)


-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT
p.name,
p.description,
p.price,
c.name
FROM products p
RIGHT JOIN catalogs c
ON p.catalog_id = c.id 


-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

-- создам и наполню таблицы
DROP TABLE IF EXISTS flights;
CREATE TABLE fligts (
	id SERIAL PRIMARY KEY,
	from_city VARCHAR(255),
	to_city VARCHAR(255)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label VARCHAR(255),
	name VARCHAR(255)
);

INSERT INTO  fligts (from_city, to_city) VALUES
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');

INSERT INTO cities VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');


-- преобразование списка рейсов по условиям задачи
SELECT
id,
(SELECT name FROM cities c WHERE c.label = f.from_city) AS `from`,
(SELECT name FROM cities c WHERE c.label = f.to_city) AS `to`
FROM fligts f;


























