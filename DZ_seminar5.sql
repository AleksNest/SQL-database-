CREATE database seminar_5;

USE seminar_5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

CREATE TABLE train_schedule
(
	train_id INT NOT NULL,
    station VARCHAR(20),
    station_time TIME
);

INSERT train_schedule
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00" ),
    (110, "Palo Alto", "11:02:00" ),
    (110, "San Joze", "12:35:00"),
	(120, "San Francisco", "11:00:00"),
    (120, "Palo Alto ", "12:49:00" ), 
    (120, "San Joze", "13:30:00");

SELECT *
FROM train_schedule;

-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW `cheap_cars` AS		--  в папке  Viewes   создается табл  с именем show_aquatics
(
	SELECT *
	FROM cars
	WHERE cost  < 25000
);

SELECT *
FROM cheap_cars;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW `cheap_cars` AS		--  в папке  Viewes   создается табл  с именем show_aquatics
(
	SELECT *
	FROM cars
	WHERE cost  < 30000
);

SELECT *
FROM cheap_cars;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW `Skoda_Audi` AS		--  в папке  Viewes   создается табл  с именем show_aquatics
(
	SELECT *
	FROM cars
	WHERE name = "Skoda" OR name = "Audi"
);

SELECT *
FROM Skoda_Audi;

-- 4 Добавьте новый столбец под названием «время до следующей станции» используя оконные функции. 

SELECT *, 
-- LEAD( station_time )  OVER (PARTITION  BY train_id ORDER BY station_time) AS next_station_time,
TIMEDIFF(LEAD(station_time) OVER (PARTITION BY TRAIN_ID ORDER BY station_time), station_time) AS time_to_next_station
FROM train_schedule;

