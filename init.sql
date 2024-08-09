-- This script is for mysql

CREATE TABLE IF NOT EXISTS user(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	display_name VARCHAR(100),
	email VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL UNIQUE,
	is_active BOOLEAN NOT NULL,
	last_login DATETIME,
	register_date DATETIME NOT NULL
)

CREATE TABLE IF NOT EXISTS post(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	create_date DATETIME NOT NULL,
	edit_date DATETIME NOT NULL,
	title TEXT,
	content TEXT,
	author_id INT,
	FOREIGN KEY (author_id)
		REFERENCES user(id)
)CHARACTER SET utf8mb4


CREATE TABLE IF NOT EXISTS comment(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	create_date DATETIME NOT NULL,
	edit_date DATETIME NOT NULL,
	content TEXT,
	post_id INT,
	author_id INT,
	FOREIGN KEY (post_id)
		REFERENCES post(id),
	FOREIGN KEY (author_id)
		REFERENCES user(id)
)CHARACTER SET utf8mb4


CREATE TABLE IF NOT EXISTS post_like(
	post_id INT,
	user_id INT,
	PRIMARY KEY(post_id, user_id),
	FOREIGN KEY (post_id)
		REFERENCES post(id),
	FOREIGN KEY (user_id)
		REFERENCES user(id)
)

CREATE TABLE IF NOT EXISTS comment_like(
	comment_id INT,
	user_id INT,
	PRIMARY KEY(comment_id, user_id),
	FOREIGN KEY (comment_id)
		REFERENCES comment(id),
	FOREIGN KEY (user_id)
		REFERENCES user(id)
)
