USE codeup_test_db;

DROP IF EXISTS albums;


CREATE TABLE IF NOT EXISTS albums (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	artist VARCHAR(30) NOT NULL,
	name VARCHAR (50) NOT NULL,
	release_date YEAR(4),
	sales ,
	genre VARCHAR

);