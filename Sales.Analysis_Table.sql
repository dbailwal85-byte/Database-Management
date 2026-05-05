
CREATE DATABASE employee_project;
USE employee_project;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    sector VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE performance (
    perf_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    year INT,
    score INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO employees VALUES
(1,'Rahul Sharma','Data Analyst','IT',45000),
(2,'Anjali Verma','HR Executive','HR',40000),
(3,'Amit Singh','Sales Manager','Sales',55000),
(4,'Neha Gupta','Data Scientist','IT',70000),
(5,'Rohit Kumar','Accountant','Finance',42000),
(6,'Priya Mehta','Business Analyst','IT',50000),
(7,'Karan Patel','Sales Executive','Sales',38000),
(8,'Sneha Kapoor','HR Manager','HR',60000),
(9,'Vikas Yadav','Data Analyst','IT',47000),
(10,'Pooja Sharma','Finance Analyst','Finance',52000),
(11,'Arjun Singh','Developer','IT',65000),
(12,'Simran Kaur','Marketing Exec','Marketing',39000),
(13,'Mohit Jain','Sales Manager','Sales',58000),
(14,'Riya Arora','HR Executive','HR',41000),
(15,'Nikhil Verma','Data Analyst','IT',48000);

INSERT INTO performance (emp_id, year, score) VALUES
(1,2025,88),(2,2025,72),(3,2025,65),(4,2025,91),(5,2025,55),
(6,2025,77),(7,2025,49),(8,2025,85),(9,2025,68),(10,2025,74),
(11,2025,82),(12,2025,60),(13,2025,90),(14,2025,52),(15,2025,79);


SELECT 
    e.emp_id,
    e.name,
    e.role,
    e.sector,
    e.salary AS current_salary,
    p.score AS performance_score,

    -- PERFORMANCE CATEGORY
    CASE
        WHEN p.score >= 85 THEN 'Excellent'
        WHEN p.score >= 70 THEN 'Good'
        WHEN p.score >= 50 THEN 'Average'
        ELSE 'Poor'
    END AS feedback,

    -- INCREMENT %
    CASE
        WHEN p.score >= 85 THEN 20
        WHEN p.score >= 70 THEN 10
        WHEN p.score >= 50 THEN 5
        ELSE 0
    END AS increment_percent,

    -- NEW SALARY
    ROUND(
        e.salary + 
        (e.salary * 
            CASE
                WHEN p.score >= 85 THEN 0.20
                WHEN p.score >= 70 THEN 0.10
                WHEN p.score >= 50 THEN 0.05
                ELSE 0
            END
        ), 2
    ) AS new_salary

FROM employees e
JOIN performance p 
ON e.emp_id = p.emp_id;