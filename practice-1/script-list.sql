CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    PRIMARY KEY (emp_id, department)
)
PARTITION BY LIST COLUMNS (department) (
    PARTITION p_sales VALUES IN ('Sales', 'Marketing'),
    PARTITION p_engineering VALUES IN ('Engineering', 'Research'),
    PARTITION p_support VALUES IN ('Support', 'HR'),
    PARTITION p_other VALUES IN ('Finance')
);

INSERT INTO employees (emp_name, department, salary) VALUES
('John Doe', 'Sales', 50000.00),
('Jane Smith', 'Engineering', 60000.00),
('Alice Johnson', 'Support', 45000.00),
('Bob Brown', 'Marketing', 55000.00),
('Emily Davis', 'HR', 48000.00),
('Michael Wilson', 'Research', 62000.00),
('David Lee', 'Finance', 58000.00);

SELECT * FROM employees WHERE department = 'Sales';

SELECT * FROM employees;

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

ALTER TABLE employees
ADD PARTITION (PARTITION p_new VALUES IN ('NewDept'));

SELECT 
    partition_name, 
    table_rows 
FROM 
    information_schema.partitions 
WHERE 
    table_schema = DATABASE() 
    AND table_name = 'employees';
