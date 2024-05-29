CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    order_date DATE,
    customer_id INT,
    amount DECIMAL(10, 2),
    PRIMARY KEY (order_id, customer_id)
)
PARTITION BY HASH (customer_id) PARTITIONS 4;

INSERT INTO orders (order_date, customer_id, amount) VALUES
('2023-01-15', 1, 100.00),
('2023-02-20', 2, 200.00),
('2023-03-25', 3, 150.00),
('2023-04-30', 4, 300.00),
('2023-05-05', 5, 250.00),
('2023-06-10', 6, 180.00),
('2023-07-15', 7, 220.00),
('2023-08-20', 8, 260.00);

SELECT * FROM orders WHERE customer_id = 1;

SELECT * FROM orders;

SELECT customer_id, SUM(amount) AS total_amount
FROM orders
GROUP BY customer_id;

ALTER TABLE orders
PARTITION BY HASH (customer_id) PARTITIONS 6;

SELECT 
    partition_name, 
    table_rows 
FROM 
    information_schema.partitions 
WHERE 
    table_schema = DATABASE() 
    AND table_name = 'orders';
