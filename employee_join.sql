-- Write a query that shows each department along with the name of the current manager for that department.
	-- DEPARTMENTS -> DEPARTMENT MANAGERS -> EMPLOYEES
	SELECT 
		dpt.dept_name AS "Department Name", 
		CONCAT(emp.first_name, " ", emp.last_name) AS "Department Manager"
	FROM departments AS dpt
	JOIN dept_manager AS dpt_man ON dpt.dept_no = dpt_man.dept_no
	JOIN employees AS emp ON emp.emp_no = dpt_man.emp_no
	WHERE dpt_man.to_date >= NOW()
	GROUP BY dpt.dept_name
	ORDER BY dpt.dept_name;


-- Find the name of all departments currently managed by women.
	-- DEPARTMENTS -> DEPARTMENT MANAGERS -> EMPLOYEES
	SELECT 
		dpt.dept_name AS "Department Name", 
		CONCAT(emp.first_name, " ", emp.last_name) AS "Department Manager"
	FROM departments AS dpt
	JOIN dept_manager AS dpt_man ON dpt.dept_no = dpt_man.dept_no
	JOIN employees AS emp ON emp.emp_no = dpt_man.emp_no
	WHERE 
		dpt_man.to_date >= NOW() AND 
		emp.gender = "F"
	GROUP BY dpt.dept_name;


-- Find the current titles of employees currently working in the Customer Service department.
	-- TITLES -> EMPLOYEES -> DEPARTMENT EMPLOYEES -> DEPARTMENTS
	SELECT 
		t.title AS "Title",
		COUNT(emp.first_name) AS "Count"
	FROM titles AS t
	JOIN employees AS emp ON t.emp_no = emp.emp_no
	JOIN dept_emp AS dpt_emp ON emp.emp_no = dpt_emp.emp_no
	JOIN departments AS dpt ON dpt.dept_no = dpt_emp.dept_no
	WHERE 
		t.to_date >= NOW() AND 
		dpt.dept_name = "Customer Service" AND 
		dpt_emp.to_date >= NOW()
	GROUP BY t.title;


-- Find the current salary of all current managers.
	-- DEPARTMENTS -> DEPARTMENT MANAGERS -> EMPLOYEES -> SALARIES
	SELECT 
		dpt.dept_name AS "Department Name", 
		CONCAT(emp.first_name, " ", emp.last_name) AS "Department Manager",
		sal.salary AS Salary
	FROM departments AS dpt
	JOIN dept_manager AS dpt_man ON dpt.dept_no = dpt_man.dept_no
	JOIN employees AS emp ON emp.emp_no = dpt_man.emp_no
	JOIN salaries AS sal ON emp.emp_no = sal.emp_no
	WHERE 
		dpt_man.to_date >= NOW() AND 
		sal.to_date >= NOW()
	ORDER BY sal.salary;



-- ----------------------------------------------- BONUS -----------------------------------------------

-- Find the names of all current employees, their department name, and their current manager's name.
	-- EMPLOYEES -> DEPARTMENT MANAGERS -> DEPARTMENTS -> DEPARTMENT MANAGERS -> EMPLOYEES
	SELECT
		CONCAT(emp.first_name, " ", emp.last_name) AS "Employee Name",
		dpt.dept_name AS "Department Name",
		CONCAT(managers.first_name, " ", managers.last_name) AS "Manager Name"
	FROM employees AS emp
	JOIN dept_emp AS dpt_emp ON emp.emp_no = dpt_emp.emp_no
	JOIN departments AS dpt ON dpt_emp.dept_no = dpt.dept_no
	JOIN dept_manager AS dpt_man ON dpt.dept_no = dpt_man.dept_no
	JOIN employees AS managers ON managers.emp_no = dpt_man.emp_no
	WHERE 
		dpt_emp.to_date >= NOW() AND 
		dpt_man.to_date >= NOW()
	ORDER BY dpt.dept_name;



-- ----------------------------------------- DOUBLE BONUS ----------------------------------------------

-- Historic average salary of female managers vs male managers
	-- DEPARTMENTS -> DEPARTMENT MANAGERS -> EMPLOYEES -> SALARIES
	SELECT 
		AVG(sal.salary) AS "Salary Count",
		emp.gender AS "Gender"
	FROM departments AS dpt
	JOIN dept_manager AS dpt_man ON dpt.dept_no = dpt_man.dept_no
	JOIN employees AS emp ON emp.emp_no = dpt_man.emp_no
	JOIN salaries AS sal ON emp.emp_no = sal.emp_no
	GROUP BY emp.gender;

		-- Average Salary  | Gender
		-- 72810.9489      |  M
		-- 62037.2170      |  F


-- Current average salary of female managers vs male managers
	-- DEPARTMENTS -> DEPARTMENT MANAGERS -> EMPLOYEES -> SALARIES
	SELECT 
		AVG(sal.salary) AS "Average Salary",
		emp.gender AS "Gender"
	FROM departments AS dpt
	JOIN dept_manager AS dpt_man ON dpt.dept_no = dpt_man.dept_no
	JOIN employees AS emp ON emp.emp_no = dpt_man.emp_no
	JOIN salaries AS sal ON emp.emp_no = sal.emp_no
	WHERE 
		dpt_man.to_date >= NOW()
	GROUP BY emp.gender;


		-- Average Salary  | Gender
		-- 68566.5278      |  M
		-- 61103.5075      |  F


-- Historic average salary of female workers vs male workers
	-- EMPLOYEES -> SALARIES
	SELECT
		avg(sal.salary) AS "Average Salary",
		emp.gender AS "Gender"
	FROM employees AS emp
	JOIN salaries AS sal ON sal.emp_no = emp.emp_no
	GROUP BY emp.gender
	ORDER BY emp.gender DESC;

		-- Average Salary  | Gender
		-- 63769.6032      |  F
		-- 63838.1769      |  M


-- Current average salary of female workers vs male workers
	-- EMPLOYEES -> SALARIES
	SELECT
		avg(sal.salary) AS "Average Salary",
		emp.gender AS "Gender"
	FROM employees AS emp
	JOIN salaries AS sal ON sal.emp_no = emp.emp_no
	WHERE
		sal.to_date >= NOW()
	GROUP BY emp.gender
	ORDER BY emp.gender DESC;

		-- Average Salary  | Gender
		-- 71963.5708      |  F
		-- 72044.6570      |  M


-- Current count of female managers vs male managers
	-- DEPARTMENTS -> DEPARTMENT MANAGERS -> EMPLOYEES
	SELECT 
		COUNT(emp.gender) AS "Manager Count",
		emp.gender AS "Gender"
	FROM departments AS dpt
	JOIN dept_manager AS dpt_man ON dpt.dept_no = dpt_man.dept_no
	JOIN employees AS emp ON emp.emp_no = dpt_man.emp_no
	WHERE 
		dpt_man.to_date >= NOW()
	GROUP BY emp.gender;

		-- Manager Count  | Gender
		-- 5              |  M
		-- 4              |  F

	
-- Current count of female engineers vs male engineers
	-- TITLES -> EMPLOYEES
	SELECT
		COUNT(emp.gender) AS "Engineer Count",
		emp.gender AS "Gender"
	FROM titles AS t
	JOIN employees AS emp ON emp.emp_no = t.emp_no
	WHERE
		t.title = "Engineer" AND 
		t.to_date >= NOW()
	GROUP BY emp.gender
	ORDER BY emp.gender DESC;

		-- Engineer Count | Gender
		-- 12412          |  F
		-- 18571          |  M






