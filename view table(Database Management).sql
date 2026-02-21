create database view;

use view;

CREATE TABLE department (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT
);

INSERT INTO employee VALUES
(101, 'Amit', 50000, 1),
(102, 'Riya', 70000, 2),
(103, 'Karan', 60000, 2),
(104, 'Neha', 55000, 3); 

# basic starting pratice questions 

create view total_emp as select emp_name from employee;

SELECT * FROM total_emp;

create view emp_safe as select emp_id,emp_name from employee;

select*from emp_safe;

drop view emp_safe;

create view emp_tol as select emp_id , salary from employee;

select * from emp_tol;

create view emp as select emp_name,dept_id from employee;

select*from emp;

create view emppp as select emp_id,emp_name,salary from employee
where salary>5000;

select * from emppp;

select*from employee;

create  view dept_id as select dept_id,emp_name from employee
where dept_id = 2;

select * from dept_id;

create view empA  as select* from employee
where emp_name like 'a%' ;

select * from empA;

create view vo_salary as select emp_name,emp_id,dept_id from employee;

select*from vo_salary;

create  view salary_5 as select* from employee
where salary between 50000 and 60000;

select*from salary_5;

# Create a view to display employee name and department name.

create view namess as select e.emp_name,d.dept_name from employee e
join department d on e.dept_id = d.dept_id;
 
select*from namess;

# Create a view to show employees with salary greater than 55000.

create view emp_salaryy  as select* from employee where salary>55000;
select*from emp_salaryy;

# Create a view showing employee name, salary, and department name.

create view emp_dataaa as select e.emp_name,salary,dept_name from employee e
join department d on e.dept_id= d.dept_id;
select*from emp_dataaa;

# Create a view to show only IT department employees.

create view deptit as select e.emp_name,d.dept_name from employee e
join  department d on e.dept_id=d.dept_id 
where dept_name = "it";

select*from deptit;

# Update salary using a view.

SET SQL_SAFE_UPDATES = 0;

create view up_sal as select* from employee;
update emp_salary set salary=60000
where emp_id= 101 ;

select*from up_sal; 

# Create a view to display average salary by department.

create view avg_sal as select avg(e.salary) as avg_salary ,d.dept_name from employee e
join department d on e.dept_id=d.dept_id
group by d.dept_name ;

select*from avg_sal;

# Drop a view.
drop view avg_sal;

# Create a view with CHECK OPTION.
create view emp_check as select* from employee
with check option;
select*from emp_check;

# Show all views in the database.
show full tables 
where table_type='view';

SELECT table_name
FROM information_schema.views
WHERE table_schema = DATABASE();
