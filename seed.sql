use DATABASE EDUSYNC;
CREATE roles(id int PRIMARY KEY AUTO_INCREMENT ,label varchar(255))
CREATE TABLE users(id int PRIMARY KEY AUTO_INCREMENT ,firstname varchar(100),lastname varchar(100),email varchar(100) UNIQUE,passwordl varchar(100),role_id int,Foreign Key (role_id) REFERENCES roles(id));
CREATE TABLE classes(id int PRIMARY KEY AUTO_INCREMENT ,name varchar(100),classroom_number varchar(255)) ;


