
#ENTITIES: 1)USER 2)PHOTOS 3)COMMENTS 4)LIKES 5)HASHTAGS 6)FOLLOWERS/FOLLOWING
-- DROP DATABASE gram_clone;

CREATE DATABASE gram_clone;
USE gram_clone;

CREATE TABLE users(
	id INTEGER AUTO_INCREMENT,
	username VARCHAR(255) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (id)
);

CREATE TABLE photos(
	id INTEGER NOT NULL AUTO_INCREMENT,
	image_url VARCHAR(255) NOT NULL,
	user_id INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments(
	id INTEGER NOT NULL AUTO_INCREMENT,
	comment_text VARCHAR(255) NOT NULL,
	user_id INTEGER NOT NULL,
	photo_id INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (photo_id) REFERENCES photos(id)
	);

CREATE TABLE likes(
	user_id INTEGER NOT NULL,
	photo_id INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY(user_id, photo_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (photo_id) REFERENCES photos(id)
);

CREATE TABLE follows(
	follower_id INTEGER NOT NULL,
	followee_id INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (follower_id) REFERENCES users(id),
	FOREIGN KEY (followee_id) REFERENCES users(id),
	PRIMARY KEY (follower_id, followee_id)
);

CREATE TABLE tags(
	id INTEGER NOT NULL AUTO_INCREMENT,
	tag_name VARCHAR(255) NOT NULL UNIQUE,
	created_at TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY(id)
);

CREATE TABLE photo_tag(
	photo_id INTEGER NOT NULL,
	tag_id INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (photo_id) REFERENCES photos(id),
	FOREIGN KEY (tag_id) REFERENCES tags(id),
	PRIMARY KEY (photo_id,tag_id)
);