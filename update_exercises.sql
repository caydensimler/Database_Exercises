USE codeup_test_db;

-- ALL ALBUMS SALES TIMES 10

	UPDATE albums 
	SET sales = (sales*10);

	-- SELECT * FROM albums;

-- ALL ALBUMS BEFORE 1980 BACK TO THE 1800s

	UPDATE albums 
	SET release_date = (release_date-100) 
	WHERE release_date < 1980;

	-- SELECT * FROM albums WHERE release_date < 1980;

-- CHANGE MICHAEL JACKSON TO PETER JACKSON

	UPDATE albums 
	SET artist = "Peter Jackson" 
	WHERE artist = "Michael Jackson";

	-- SELECT artist FROM albums WHERE artist = "Peter Jackson";

-- SHOW ALL WORK	

	SELECT * FROM albums;