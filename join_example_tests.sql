-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
-- Before you run each query, guess the expected number of results.
	SELECT u.name AS NAME, u.email AS Email, r.name AS Role 
	FROM users AS u
	LEFT JOIN roles AS r ON u.role_id = r.id;

-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role.
	SELECT r.name AS Role, COUNT(u.role_id)
	FROM roles as r
	LEFT JOIN users as u ON u.role_id = r.id
	GROUP BY r.name;

