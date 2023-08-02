CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, FOREIGN KEY REFERENCES customers(customer_id),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Inserting a new customer
INSERT INTO customers (customer_id, customer_name, email, phone)
VALUES (1, 'John Doe', 'john@example.com', '123-456-7890');

-- Inserting another customer
INSERT INTO customers (customer_id, customer_name, email, phone)
VALUES (2, 'Jane Smith', 'jane@example.com', '987-654-3210');

-- Inserting a new order for customer with customer_id = 1
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (101, 1, '2023-07-21', 500.00);

-- Inserting another order for customer with customer_id = 2
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (102, 2, '2023-07-21', 350.50);

SELECT c.customer_id, c.customer_name, c.email, c.phone,
       o.order_id, o.order_date, o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.customer_id, c.customer_name, c.email, c.phone,
       o.order_id, o.order_date, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

