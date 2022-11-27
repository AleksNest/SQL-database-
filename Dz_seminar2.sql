SHOW DATABASES;

USE seminar_2;

CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date  DATE NOT NULL,
    count_product INT DEFAULT 0
);

INSERT sales (order_date, count_product)
VALUES
("2022-01-01", 156),
("2022-01-02", 180),
("2022-01-03", 21),
("2022-01-04", 124),
("2022-01-05", 341);

SELECT * FROM sales;

SELECT order_date, count_product,
CASE 
	WHEN count_product < 100 
		THEN "Маленький заказ"
     WHEN count_product BETWEEN 100 AND 300 
		THEN "Средний заказ" 
	ELSE "большой заказ"
END AS result
FROM sales;	

CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10) NOT NULL,
    amount  DECIMAL,
    order_status VARCHAR(20)
);

INSERT orders (employee_id, amount, order_status)
VALUES
("e03", 15.00, "open"),
("e01", 25.50, "open"),
("e05", 100.70, "closed"),
("e02", 22.18, "open"),
("e04", 9.50, "cancelled");

SELECT * FROM orders;

SELECT employee_id, amount,
CASE order_status
	WHEN "open" THEN "Order is in open state"
    WHEN "closed" THEN "Oder is closed"
	ELSE "Order is cancelled"
END AS full_order_status
FROM orders;	





