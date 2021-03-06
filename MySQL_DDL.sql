DROP DATABASE IF EXISTS dis;

CREATE DATABASE IF NOT EXISTS dis;

USE dis;

-- DROP TABLE
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS diary_book;
DROP TABLE IF EXISTS participation_personnel_list;
DROP TABLE IF EXISTS diary;

CREATE TABLE IF NOT EXISTS user (
    id VARCHAR(12) NOT NULL,
    password VARCHAR(128) NOT NULL,
    username VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS diary_book (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    code CHAR(6) NOT NULL,
    owner VARCHAR(12) NOT NULL,
    
    FOREIGN KEY (owner) REFERENCES user(id) ON UPDATE CASCADE,
    
    PRIMARY KEY (id),
    UNIQUE(code)
);

CREATE TABLE IF NOT EXISTS participation_personnel_list (
    user_id VARCHAR(12) NOT NULL,
    diary_book_id INT(11) NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES user(id) ON UPDATE CASCADE,
    FOREIGN KEY (diary_book_id) REFERENCES diary_book(id) ON UPDATE CASCADE,
    
    PRIMARY KEY (user_id, diary_book_id)
);

CREATE TABLE IF NOT EXISTS diary (
    id INT(11) NOT NULL AUTO_INCREMENT,
    diary_book_id INT(11) NOT NULL,
    author VARCHAR(12) NOT NULL,
    content VARCHAR(240) NOT NULL,
    page INT(11) NOT NULL,
    
    FOREIGN KEY (author) REFERENCES user(id) ON UPDATE CASCADE,
    
    PRIMARY KEY (id)
);
