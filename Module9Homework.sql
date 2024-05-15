CREATE TABLE departments (dept_no VARCHAR(30) NOT NULL PRIMARY KEY, 
-- 						  dept_name VARCHAR(30));
-- CREATE TABLE titles (title_id CHAR(5) NOT NULL PRIMARY KEY, 
-- 					 title VARCHAR(30));
-- CREATE TABLE salaries (emp_no INT NOT NULL PRIMARY KEY, 
-- 					   salary DECIMAL);
-- CREATE TABLE employees (emp_no INT NOT NULL PRIMARY KEY, 
-- 						emp_title_id CHAR(5), FOREIGN KEY (emp_title_id) REFERENCES titles(title_id), 
-- 						birth_date DATE, 
-- 						first_name VARCHAR (30),
-- 						last_name VARCHAR(30),
-- 						sex VARCHAR(6),
-- 						hire_date DATE);
-- CREATE TABLE dept_manager (dept_no CHAR(4), 
-- 						   emp_no INT, FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
-- CREATE TABLE dept_emp (emp_no INT, 
-- 					   dept_no VARCHAR(30), FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
						  
						  
-- List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no as employee_number, employees.last_name, employees.first_name, employees.sex, 
salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986						  
SELECT first_name, last_name, hire_date 
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY-MM-DD') LIKE '1986%';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name						  
SELECT dept_manager.dept_no, dept_manager.emp_no, 
departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no;

/*List the department number for each employee along with that employee’s employee number, last name, first name, and department name */						  
SELECT employees.last_name, employees.first_name, departments.dept_no, departments.dept_name,
employees.emp_no
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.last_name, employees.first_name;

/*List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B */						  
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';
	
/*List each employee in the Sales department, including their employee number, last name, and first name.
Got tired of using joins.*/ 
SELECT emp_no, last_name, first_name
FROM employees 
WHERE emp_no IN 
(
	SELECT emp_no 
	FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);
						  
/*List each employee in the Sales and Development departments, 
  including their employee number, last name, first name, and department name*/
						  
						  
						  
						  
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM departments;
SELECT * FROM titles;
