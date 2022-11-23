SELECT * FROM seminar_1.mobilephone;   

USE seminar1;

# 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)
SELECT ProductName, Manufactorer, Price
FROM mobilephone
WHERE ProductCount > 2;

#3. Выведите весь ассортимент товаров марки “Samsung”
SELECT ProductName
FROM mobilephone
WHERE Manufactorer = "Samsung";

#4.1 *** С помощью регулярных выражений найти товары, в которых есть упоминание "Iphone"
SELECT ProductName, Manufactorer, Price
FROM mobilephone
WHERE ProductName LIKE "Iphone%";

#4.2 *** С помощью регулярных выражений найти товары, в которых есть упоминание "Galaxy
SELECT ProductName, Manufactorer, Price
FROM mobilephone
WHERE ProductName LIKE "Galaxy%";

#4.3 *** С помощью регулярных выражений найти товары, в которых есть цифры
SELECT ProductName, Manufactorer, Price
FROM mobilephone
WHERE ProductName RLIKE "[:digit:]";

#4.4 *** С помощью регулярных выражений найти товары, в которых есть цифра 8
SELECT ProductName, Manufactorer, Price
FROM mobilephone
WHERE ProductName LIKE "%8%";