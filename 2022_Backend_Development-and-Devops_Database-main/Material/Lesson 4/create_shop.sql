CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	description TEXT,
	availability INT DEFAULT 0,
	price DECIMAL NOT NULL
);

CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE employees(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	phone VARCHAR(30) NOT NULL
);

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
	order_date TIMESTAMP DEFAULT now(),
	customer_id INT,
	employee_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(id)
		ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_sold_by FOREIGN KEY (employee_id) REFERENCES employees(id) 
		ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO customers (first_name, last_name, email) VAlUES
("John", "Doe", "abc@email.com");

SET @customer_id = LAST_INSERT_ID();

INSERT INTO employees (first_name, last_name, email, phone) VALUES
("Jane", "Doe", "employee1@company.com", "887896564");

SET @employee_id = LAST_INSERT_ID();

INSERT INTO orders(customer_id, employee_id) VALUES
(@customer_id, @employee_id);

SELECT orders.id, orders.order_date, customers.first_name as customer_name, employees.first_name as employee_name
FROM employees
RIGHT JOIN orders ON orders.employee_id = employees.id
RIGHT JOIN customers ON orders.customer_id = customers.id;


SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM orders;

UPDATE customers SET id=10 WHERE id=1;

DELETE FROM customers WHERE id=10;

DELETE FROM employees;

-- New lines 17.2.
CREATE TABLE order_details(
	product_id INT NOT NULL,
	order_id INT NOT NULL,
	count INT,
	PRIMARY KEY(product_id, order_id),
	FOREIGN KEY(product_id) REFERENCES products(id),
	FOREIGN KEY(order_id) REFERENCES orders(id)
);

INSERT INTO products(name, description, availability, price) VALUES 
("Fancy keyboard", "Shines in all rainbow colours", 10, 89.95), 
("Gaming mouse", "Incredibly high DPI: 25k", 25, 44.99), 
('32" gaming monitor', "Fast 165Hz monitor with ultra accurate colours", 2, 699.95), 
("Hifi headphones", "Experience music like never before! NOT suitable for gaming!", 1, 99000);

INSERT INTO customers(first_name, last_name, email) VALUES ("Simon", "Shopper", "simon@shopper.com");
INSERT INTO employees(first_name, last_name, email, phone) VALUES ("Erika", "Example", "erika@company.com", "0302001100030303");

INSERT INTO orders(customer_id, employee_id) VALUES (12,2);
INSERT INTO order_details(product_id, order_id, count) VALUES (4, 3, 1);
