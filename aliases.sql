SELECT CONCAT(emp_no, " - ", last_name, ", ", first_name) AS full_name, birth_date as DOB 
FROM employees
LIMIT 10;


SELECT employees.emp_no, CONCAT(first_name, " ", last_name) AS NAME, salaries.salary AS Salary, titles.title AS Title, departments.dept_name AS Department
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
JOIN titles ON employees.emp_no = titles.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE salaries.salary > 100000
ORDER BY salary DESC;
