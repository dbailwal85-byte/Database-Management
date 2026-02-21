
create database subquery;

CREATE TABLE Employe (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    salary INT
);

INSERT INTO Employe(emp_id, emp_name, dept_id, salary) VALUE
(1, 'John', 101, 50000,28),
(2, 'Emma', 101, 65000,32),
(3, 'Raj', 102, 45000,26),
(4, 'Meera', 103, 70000,38),
(5, 'Ravi', 102, 48000,30),
(6, 'Naina', 103, 52000,29),
(7, 'Alex', 101, 58000,31);

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

INSERT INTO Department (dept_id, dept_name) VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'Finance'),
(104, 'HR');

use subquery;

 # Find employees whose salary is greater than average salary.
select emp_id, emp_name, salary
from employe
where salary > (select avg(salary) from employees);


# Find employees whose salary is greater than average salary.
select emp_id, emp_name, salary
from employees_2
where salary > (select avg(salary) from employees);

# Find employees who work in the sales department.
select * from employees_2
where dept_id = (select dept_id from depart where dept_name = 'Sales');

# Find the highest paid employee
SELECT
	emp_name,
    salary
FROM employees_2
WHERE salary=(SELECT MAX(salary) FROM employees_2);

# Find employee older than the youngest employee
SELECT emp_name,age,
    (SELECT MIN(age) FROM employees_2) as youngest_emplooyee
FROM employees_2
WHERE age>(SELECT MIN(age) FROM employees_2);

# Find employees whose salary is greater than the average salary
SELECT
	emp_name,
    salary,
    (SELECT AVG(salary) FROM employees_2) as average_salary
FROM employees_2
WHERE salary>(SELECT AVG(salary) FROM employees);

# List employees who earn more than John
SELECT
	emp_name,
    salary,
    (SELECT salary FROM employees_2 WHERE emp_name="John") as John_Salary
FROM employees_2
WHERE salary>(SELECT salary FROM employees_2 WHERE emp_name="John");

# Find employees in departments where the average salary is above 50000
SELECT dept_id,emp_name, salary
FROM employees_2
WHERE dept_id IN(
(SELECT
	dept_id
FROM employees_2
GROUP BY dept_id
having avg(salary)>50000));
# Find Employees whose salary is second highest
SELECT
	emp_name,
    salary
FROM employees_2
WHERE salary<(SELECT MAX(salary) FROM employees_2)
ORDER BY salary DESC
LIMIT 1;

# Find employees in the same department as Emma
SELECT
	emp_name,
    dept_id
FROM employees_2
WHERE dept_id=(SELECT dept_id FROM employees_2 WHERE emp_name="Emma");

# List Departments that have nore than 2 employees.
SELECT 
	dept_name
FROM depart
WHERE dept_id 
IN(SELECT dept_id FROM employees_2 GROUP BY dept_id HAVING COUNT(dept_id)>2);

# Find employees who earn more than every employee in marketing
SELECT
	emp_name,
    salary
FROM employees_2
WHERE salary>(SELECT MAX(salary) FROM employees_2 WHERE dept_id=
(SELECT dept_id FROM depart WHERE dept_name="Marketing"));

# Find employees who earn the minimum salary in their department

SELECT e.emp_name, e.salary, e.dept_id
FROM Employee e
WHERE e.salary = (SELECT MIN(salary)
    FROM Employee
    WHERE dept_id = e.dept_id);

# Find employees whose salary is above the department average

SELECT e.emp_name, e.salary, e.dept_id
FROM Employee e
WHERE e.salary > (SELECT AVG(salary)
    FROM Employee
    WHERE dept_id = e.dept_id);
    
# List employees who are younger than Emma
SELECT emp_name, age
FROM employee
WHERE age < (
    SELECT age
    FROM employee
    WHERE emp_name = 'Emma'
);
# Find employees who do NOT work in any department present in the DEPARTMENT table.
SELECT e.emp_name
FROM employee e
LEFT JOIN department d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

# Find the top 2 highest salaries using a subquery.
SELECT emp_name, salary
FROM employee
WHERE salary IN (
    SELECT salary
    FROM ( SELECT DISTINCT salary FROM employee ORDER BY salary DESC LIMIT 2) AS t);
    
# Count employees in the department with the highest average salary.
SELECT COUNT(*)
FROM employee
WHERE dept_id = ( SELECT dept_id 
FROM employee 
GROUP BY dept_id 
ORDER BY AVG(salary) DESC LIMIT 1);

# Display employees whose salary is below department average.

SELECT emp_name, salary
FROM employee e
WHERE salary < (SELECT AVG(salary) FROM employee WHERE dept_id = e.dept_id);

