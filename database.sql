CREATE TABLE users ( 
	id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(64) NOT NULL,
	password VARCHAR(64) NOT NULL,
	role ENUM('ADMIN','PUBLISHER','USER') NOT NULL DEFAULT 'USER',
	picture TEXT NOT NULL,
    firstname VARCHAR(32) NOT NULL,
	lastname varchar(32) not null,
	birth DATE not null,
	nationality varchar(32) not null,
	studyin varchar(32) not null,
	PRIMARY KEY (id)
);

INSERT INTO users (username, password, role) VALUES ('admin', 'admin', 'ADMIN'), ('test', 'test', 'USER');

CREATE TABLE posts (
	id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(64) NOT NULL,
    message TEXT NOT NULL,
    parent_id INT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE attachedcontent (
	id INT NOT NULL AUTO_INCREMENT,
    content TEXT NOT NULL,
    post_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

INSERT INTO posts (title, message, user_id, parent_id) VALUES ('Dpostsublin', '', 1, NULL), ('Test within Dublin', 'This post is a test', 1, 1);

CREATE TABLE conversation (
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(64) NOT NULL,
    image TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE convmessage (
	id INT NOT NULL AUTO_INCREMENT,
    message TEXT NOT NULL,
    user_id INT NOT NULL,
    conv_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (conv_id) REFERENCES conversation(id)
);

INSERT INTO conversation (title, image) VALUES ('Test conv', '');

INSERT INTO convmessage (user_id, conv_id, message) VALUES (1, 1, 'Hello'), (2, 1, 'Hey');


