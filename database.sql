CREATE TABLE users ( 
	id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(64) NOT NULL,
	password VARCHAR(64) NOT NULL,
	role ENUM('ADMIN','PUBLISHER','USER') NOT NULL DEFAULT 'USER',
	picture TEXT NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO users (username, password, role) VALUES ('admin', 'admin', 'ADMIN'), ('test', 'test', 'USER');