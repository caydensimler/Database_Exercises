-- Find all the employees with the same hire date as employee 101010 using a sub-query.
SELECT CONCAT(first_name, " ", last_name) AS "Name"
FROM employees 
WHERE hire_date IN 	(
	SELECT hire_date
	FROM employees
	WHERE emp_no = 101010
);


-- Find all the titles held by all employees with the first name Aamod.
	-- SUB-QUERY METHOD
	SELECT title
	FROM titles
	WHERE emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE first_name = "Aamod"
	);

	-- JOIN METHOD
	SELECT title as "Title", CONCAT(e.first_name, " ", e.last_name) AS "Name"
	FROM titles as t
	JOIN employees as e ON e.emp_no = t.emp_no
	WHERE e.first_name = "Aamod";


-- Find all the department managers that are female.
	-- SUB-QUERY METHOD
	SELECT CONCAT(first_name, " ", last_name) AS "Name"
	FROM employees
	WHERE emp_no IN (
		SELECT emp_no
		FROM dept_manager
		WHERE to_date >= NOW()
	) AND gender = "F";

	-- JOIN METHOD
	SELECT CONCAT(first_name, " ", last_name) AS "Name", dn.dept_name AS "Department Name"
	FROM employees AS e
	JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
	JOIN departments AS dn ON dm.dept_no = dn.dept_no
	WHERE gender = "F" AND dm.to_date >= NOW();


-- BONUS Find all the department names that have female managers.
SELECT dept_name AS "Department Name"
FROM departments
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_manager
	WHERE emp_no IN (
			SELECT emp_no
			FROM employees
			WHERE gender = "F"
		) AND to_date >= NOW()
);

-- 



