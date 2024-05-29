CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT,
    sale_date DATE,
    customer_id INT,
    amount DECIMAL(10, 2),
    PRIMARY KEY (sale_id, sale_date)
)
PARTITION BY RANGE (YEAR(sale_date)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024)
);

INSERT INTO sales (sale_date, customer_id, amount) VALUES
('2020-05-15', 1, 100.00),
('2020-07-22', 2, 200.00),
('2021-03-10', 3, 150.00),
('2021-11-23', 4, 300.00),
('2022-01-05', 5, 250.00),
('2023-06-18', 6, 180.00);

SELECT * FROM sales WHERE sale_date BETWEEN '2021-01-01' AND '2021-12-31';

SELECT * FROM sales;

SELECT YEAR(sale_date) AS sale_year, SUM(amount) AS total_sales
FROM sales
GROUP BY sale_year;

ALTER TABLE sales
ADD PARTITION (PARTITION p2024 VALUES LESS THAN (2025));

SELECT 
    partition_name, 
    table_rows 
FROM 
    information_schema.partitions 
WHERE 
    table_schema = 'practice' 
    AND table_name = 'sales';
