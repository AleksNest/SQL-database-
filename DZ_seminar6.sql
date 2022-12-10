CREATE database seminar_6;
USE seminar_6;

-- Задание 1: Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- 			Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER //
CREATE FUNCTION `converter_To_Days`(seconds INT)
RETURNS varchar(50)
DETERMINISTIC
BEGIN
	declare minutes INT DEFAULT 0;
    declare hours INT DEFAULT 0;
    declare days INT DEFAULT 0;
    declare result VARCHAR(50) DEFAULT "0";	
    
    SET days = FLOOR (seconds / 86400);
    SET hours = FLOOR ((seconds - 86400 * days) / 3600);
    SET minutes = FLOOR ((seconds - 86400 * days - 3600 * hours) / 60);
    SET seconds = seconds - 86400 * days - 3600 * hours - 60 * minutes;
    SET result = CONCAT( days," days: ",hours," hours: ", minutes," minutes: ", seconds," seconds: ");
    RETURN result;
   END //
 DELIMITER ;
 
SELECT converter_To_Days(21150053) AS RESULT ; 

-- Задание 2 Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=
DELIMITER //
CREATE PROCEDURE evenNumbers()
BEGIN
	declare num1 INT DEFAULT 0;
    declare num2 INT DEFAULT 10;
    declare result VARCHAR(30) DEFAULT "";
	WHILE num1 < num2 DO
		   SET num1 = num1 + 2;
           SET result = CONCAT(result," ",num1);
		END WHILE;
	SELECT result;
END //
DELIMITER ;

CALL evenNumbers();

-- универсальный метод вывода в диапозоне от num1 до num2 четных (parity =2) или нечетных (parity = 1) натуральных чисел
DELIMITER //
CREATE PROCEDURE evenNumbers1(num1 INT, num2 INT, parity INT)
BEGIN
	declare result VARCHAR(50) DEFAULT "";
    IF parity = 2 THEN
		WHILE num1 <= num2 DO
			IF num1 % 2 = 0 THEN
				SET result = CONCAT(result," ",num1);
				SET num1 = num1 + 2; 
			ELSE 
				SET num1 = num1 + 1;
            END IF;
		END WHILE;
	ELSE
		WHILE num1 <= num2 DO
			IF num1 % 2 != 0 THEN
				SET result = CONCAT(result," ",num1);
				SET num1 = num1 + 2; 
			ELSE 
				SET num1 = num1 + 1;
            END IF;
		END WHILE;
	END IF;
SELECT result;
END //
DELIMITER ;

CALL evenNumbers1(1,30,1);
