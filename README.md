📚 EduSync - School Management Database
📖 Description

EduSync is a Learning Management System (LMS) designed for Elite Academy, a growing training center.

Currently, the academy uses:

Excel for registrations
Paper for class lists
No system for teachers to track students

👉 This project solves these problems by creating a centralized, secure, and structured database using MySQL.

🎯 Objective

Build a normalized relational database to:

Organize users (Admin, Teacher, Student)
Manage classes and courses
Handle student enrollments
Ensure data integrity and security
🛠️ Technologies Used
MySQL
SQL (DDL & DML)
ERD (Lucidchart)
🗂️ Database Structure
1. Roles

Defines user types.

Field	Type	Description
id	INT (PK)	Unique ID
label	VARCHAR	Role name (Admin, Prof, Student)

👉 Relation: 1 Role → Many Users (1:N)

2. Users

Stores login information.

Field	Type
id	INT (PK)
firstname	VARCHAR
lastname	VARCHAR
email	VARCHAR (UNIQUE)
password	VARCHAR (HASHED)
role_id	INT (FK)

👉 Relation:

Each user has one role
1:N (Role → Users)
3. Classes

Represents student groups.

Field	Type
id	INT (PK)
name	VARCHAR
classroom_number	VARCHAR

👉 Relation:

1 Class → Many Students (1:N)
4. Courses

Represents subjects.

Field	Type
id	INT (PK)
title	VARCHAR
description	TEXT
total_hours	INT
teacher_id	INT (FK → users.id)

👉 Relation:

One teacher can teach many courses
1:N (User → Courses)
5. Students

Contains student-specific data.

Field	Type
id	INT (PK & FK → users.id)
dateofbirth	DATE
student_number	VARCHAR (UNIQUE)
class_id	INT (FK)

👉 Relations:

1:1 (User ↔ Student)
1:N (Class → Students)
6. Enrollments

Handles course registrations.

Field	Type
id	INT (PK)
student_id	INT (FK)
course_id	INT (FK)
enrolled_at	DATE
status	ENUM (Active, Completed)

👉 Relations:

Many-to-Many (Students ↔ Courses) via enrollments

👉 Constraint:

A student cannot enroll twice in the same course
Use UNIQUE(student_id, course_id)
🔗 Relationships Summary
Roles → Users → 1:N
Users → Students → 1:1
Classes → Students → 1:N
Users (Teacher) → Courses → 1:N
Students ↔ Courses → N:N (via Enrollments)
🧱 Database Files
structure.sql → Creates database and tables
seed.sql → Inserts test data
🔐 Data Integrity
✅ Primary Keys (AUTO_INCREMENT)
✅ Foreign Keys (FK constraints)
✅ UNIQUE constraints (email, student_number)
✅ ENUM for status
✅ ON DELETE (CASCADE / RESTRICT)
⚙️ How to Run
# Create database
mysql -u root -p < structure.sql

# Insert test data
mysql -u root -p < seed.sql
📊 ERD Diagram

👉 (Add your Lucidchart link here)

📅 Project Info
Duration: 5 days
Start Date: 13/04/2026
Submission Deadline: 17/04/2026
👨‍💻 Author
Name: Ayoub Sofi
Training: Web Developer
✅ Key Features
Centralized data management
Secure authentication system
Structured and normalized database
Support for multiple relationships (1:1, 1:N, N:N)