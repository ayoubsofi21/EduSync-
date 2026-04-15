use DATABASE EDUSYNC;
CREATE roles(id int PRIMARY KEY AUTO_INCREMENT ,label varchar(255))
CREATE TABLE users(id int PRIMARY KEY AUTO_INCREMENT ,firstname varchar(100),lastname varchar(100),email varchar(150) UNIQUE,password varchar(255),role_id int,Foreign Key (role_id) REFERENCES roles(id));
CREATE TABLE classes(id int PRIMARY KEY AUTO_INCREMENT ,name varchar(100),classroom_number varchar(255)) ;
CREATE TABLE courses(id int  PRIMARY KEY AUTO_INCREMENT ,title varchar(255),description text ,total_hours int,user_id int,FOREIGN KEY (user_id) REFERENCES users(id));
CREATE TABLE students(id int PRIMARY KEY AUTO_INCREMENT,dateofbirth date ,student_number varchar(100) UNIQUE,user_id int UNIQUE,class_id int ,FOREIGN KEY (user_id) REFERENCES users(id),FOREIGN KEY (class_id) REFERENCES classes(id)); 

-- create table enrollemnt 
CREATE TABLE enrollments(id int PRIMARY KEY AUTO_INCREMENT,enrolled_at date,student_id int ,course_id int,FOREIGN KEY (student_id) REFERENCES students(id),FOREIGN KEY (course_id) REFERENCES courses(id) ,  UNIQUE (student_id, course_id)); 
ALTER Table enrollments add status ENUM('actif','termine') DEFAULT('actif');

SELECT*FROM courses;
ALTER Table roles MODIFY label ENUM( "Admin", "Prof", "Student") not NULL;

-- ok now i want to insert data to each table 
INSERT INTO roles(label)VALUES('Admin'),('Prof'),('Student');
ALTER TABLE roles AUTO_INCREMENT=1;
-- 123456 654321 212121
INSERT INTO users (firstname, lastname, email, password, role_id) VALUES('Imane', 'Zahra', 'imane.student@gmail.com', MD5('212121'), 2),
('Ali', 'Ahmadi', 'ali.admin@gmail.com', MD5('123456'), 1),
('Sara', 'Benali', 'sara.prof@gmail.com', MD5('232334'), 2),
('Youssef', 'Karimi', 'youssef.student@gmail.com', MD5('654321'), 3);
INSERT INTO classes (name, classroom_number) VALUES
('1A Dev', 'A101'),
('2A Dev', 'B202');
INSERT INTO courses (title, description, total_hours, user_id) VALUES
('SQL Basics', 'Introduction to SQL', 30, 2),
('Web Development', 'HTML CSS JS', 40, 2);

INSERT INTO students (dateofbirth, student_number, user_id, class_id) VALUES
('2000-05-10', 'STU001', 3, 1),
('2001-08-15', 'STU002', 4, 2);
ALTER TABLE enrollments ADD status ENUM('Actif','termine');
INSERT INTO enrollments(enrolled_at,student_id,course_id,status)VALUES('2024-01-10', 1, 1, 'actif'),
('2024-01-12', 1, 2, 'Actif'),
('2024-01-15', 2, 1, 'termine');