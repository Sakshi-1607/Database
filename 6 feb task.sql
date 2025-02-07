create database questions;
use questions;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    emailid VARCHAR(100) UNIQUE,
    hire_date DATE,
    salary DECIMAL(10,2)
);

ALTER TABLE employees ADD COLUMN department VARCHAR(50);

ALTER TABLE employees MODIFY COLUMN salary DECIMAL(10,2) CHECK (salary BETWEEN 1000 AND 100000);

ALTER TABLE employees CHANGE COLUMN email contactemail VARCHAR(100) UNIQUE;

ALTER TABLE employees DROP COLUMN department;

INSERT INTO employees (firstname, lastname, emailid, hire_date, salary) VALUES
('John', 'Doe', 'john.doe@email.com', '2020-06-15', 55000),
('Jane', 'Smith', 'jane.smith@email.com', '2021-06-12', 60000),
('Emily', 'Johnson', 'emily.johnson@email.com', '2022-01-25', 65000);

INSERT INTO employees (firstname, lastname, emailid, hire_date, salary) VALUES
('Michael', 'Clark', 'michael.clark@email.com', '2023-03-01', 70000);

SELECT * FROM employees;

SELECT firstname, lastname, salary FROM employees WHERE salary > 60000;

SELECT * FROM employees ORDER BY salary DESC LIMIT 1;

SELECT COUNT(*) FROM employees WHERE hire_date < '2012-01-01';

SELECT * FROM employees ORDER BY id DESC;

SELECT * FROM employees WHERE firstname LIKE 'T%';

CREATE TABLE departments (
department_id INT PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(100));
INSERT INTO departments (department_name) VALUES
(HR),('Finance'),('Engineering');

SELECT employees.employee_id, employees.employee_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;
SELECT departments.department_name, AVG(employees.salary) AS average_salary
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
GROUP BY departments.department_name;


-- Question2-- 



CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) UNIQUE,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    status ENUM('Pending', 'Shipped', 'Delivered')
);

ALTER TABLE orders ADD COLUMN shipping_address TEXT;

ALTER TABLE orders MODIFY COLUMN order_amount DECIMAL(15,2);

ALTER TABLE orders DROP COLUMN status;

INSERT INTO orders (customer_name, order_date, order_amount) VALUES
    ('John Doe', '2025-02-01', 250.50),
    ('Alice Cooper', '2025-02-02', 500.00),
    ('Bob Lee', '2025-02-03', 1200.75);

UPDATE orders SET order_amount = 550.00 WHERE order_id = 2;

INSERT INTO orders (customer_name, order_date, order_amount) VALUES
    ('Eva Green', '2025-02-04', 300.00);

UPDATE orders SET status = 'Delivered' WHERE order_date < '2026-02-03';

SELECT * FROM orders WHERE status = 'Pending';

SELECT customer_name FROM orders GROUP BY customer_name HAVING SUM(order_amount) > 500.00;

SELECT order_id, customer_name, order_date FROM orders ORDER BY order_date ASC;

SELECT AVG(order_amount) FROM orders WHERE status = 'Shipped';

SELECT * FROM orders ORDER BY order_date DESC LIMIT 1;

SELECT customer_name FROM orders GROUP BY customer_name HAVING COUNT(order_id) > 2;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (product_name, price) VALUES
    ('Laptop', 1200.00),
    ('Phone', 800.00),
    ('Tablet', 500.00),
    ('Headphones', 150.00),
    ('Monitor', 300.00);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
    (1, 1, 1),
    (1, 2, 2),
    (2, 3, 1),
    (3, 4, 2),
    (3, 5, 1);

SELECT orders.order_id, orders.customer_name, products.product_name, order_items.quantity
FROM orders
INNER JOIN order_items ON orders.order_id = order_items.order_id
INNER JOIN products ON order_items.product_id = products.product_id;

SELECT orders.customer_name, SUM(orders.order_amount) AS total_amount
FROM orders
GROUP BY orders.customer_name;

SELECT products.product_name, SUM(products.price * order_items.quantity) AS total_revenue
FROM order_items
JOIN products ON order_items.product_id = products.product_id
GROUP BY products.product_name;

SELECT customer_name, COUNT(order_id) AS order_count FROM orders GROUP BY customer_name;

SELECT customer_name, MAX(order_amount) AS max_order_amount FROM orders;

SELECT SUM(order_amount) FROM orders WHERE status = 'Shipped';

SELECT customer_name FROM orders WHERE order_amount BETWEEN 1000.00 AND 2000.00;

SELECT * FROM orders ORDER BY order_amount DESC LIMIT 3;

CREATE INDEX idx_customer_name ON orders(customer_name);

SELECT * FROM orders WHERE order_date BETWEEN '2025-01-01' AND '2025-02-01';
