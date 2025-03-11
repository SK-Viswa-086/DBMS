CREATE TABLE departments (department_id INT PRIMARY KEY AUTO_INCREMENT,department_name VARCHAR(100) NOT NULL);
CREATE TABLE employees (emp_id INT PRIMARY KEY AUTO_INCREMENT,emp_name VARCHAR(100) NOT NULL,emp_salary DECIMAL(10,2) NOT NULL,emp_department_id INT,FOREIGN KEY (emp_department_id) REFERENCES departments(department_id) ON DELETE SET NULL);
INSERT INTO departments (department_name) VALUES ('HR'),('IT'),('Finance'),('Marketing');
INSERT INTO employees (emp_name, emp_salary, emp_department_id) VALUES('Alice', 60000, 1),('Bob', 75000, 2),('Charlie', 50000, 3),('David', 45000, 1),('Emma', 90000, 2);

SELECT * FROM employee_department_view;
SELECT emp_name, emp_salary, department_name FROM employee_department_view WHERE emp_salary> 50000;
DROP VIEW IF EXISTS employee_department_view;
CREATE VIEW employee_department_view AS SELECT e.emp_id, e.emp_name, e.emp_salary, d.department_name FROM employees e JOIN departments d ON e.emp_department_id = d.department_id;
CREATE VIEW department_salary_summary AS SELECT d.department_name, SUM(e.emp_salary) AS total_salary FROM employees e JOIN departments d ON e.emp_department_id = d.department_id GROUP BY d.department_name;
DROP VIEW IF EXISTS employee_department_view;
CREATE VIEW it_employees_view AS SELECT e.emp_name, e.emp_salary, d.department_name FROM employees e JOIN departments d ON e.emp_department_id = d.department_id WHERE d.department_name = 'IT';
CREATE VIEW high_earning_employees AS SELECT emp_name, emp_salary FROM employees WHERE emp_salary> (SELECT AVG(emp_salary) FROM employees);
CREATE VIEW employee_details_view AS SELECT e.emp_name, e.emp_salary, d.department_name FROM employees e JOIN departments d ON e.emp_department_id = d.department_id;
SELECT emp_name, emp_salary, department_name FROM employee_details_view WHERE department_name = 'HR' AND emp_salary> 50000;
