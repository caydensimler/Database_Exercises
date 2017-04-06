USE join_test_db;

TRUNCATE users;

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null),
('cayden', 'caydensimler@hotmail.com', 1),
('keri', 'keri@yahoo.com', 1),
('val', 'val@example.com', null),
('josh', 'josh@example.com', 3);