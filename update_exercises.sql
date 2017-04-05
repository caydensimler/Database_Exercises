USE codeup_test_db;

-- ALL ALBUMS SALES TIMES 10

	UPDATE albums 
	SET sales = (sales*10);

	-- SELECT * FROM albums;

-- ALL ALBUMS BEFORE 1980 BACK TO THE 1800s

	UPDATE albums
	SET release_date = DATE_SUB(release_date, INTERVAL 100 YEAR)
	WHERE release_date < '1980-01-01';

	-- SELECT * FROM albums WHERE release_date < 1980;

-- CHANGE MICHAEL JACKSON TO PETER JACKSON

	UPDATE albums 
	SET artist = "Peter Jackson" 
	WHERE artist = "Michael Jackson";

	-- SELECT artist FROM albums WHERE artist = "Peter Jackson";