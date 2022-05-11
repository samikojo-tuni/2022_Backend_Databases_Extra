-- How to return students table to its original state?
DELETE FROM students; -- Deletes all the data from the students TABLE
DROP TABLE students; -- Destroys students TABLE. Only drop and create the table again
-- if you have changed the structure of the table.

-- Create students table again from lesson1.md file and insert data from the same file.

-- As a lesson example, we created a database for a school:

CREATE TABLE teachers(
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(25),
  office VARCHAR(10) 
);

CREATE TABLE subjects(
  id INT AUTO_INCREMENT PRIMARY KEY,
  subject_name VARCHAR(100),
  description TEXT,
  credits INT
);

CREATE TABLE courses(
  id INT AUTO_INCREMENT PRIMARY KEY,
  teacher_id INT,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  subject_id INT,
  FOREIGN KEY(teacher_id) REFERENCES teachers(id),
  FOREIGN KEY(subject_id) REFERENCES subjects(id)
);

CREATE TABLE enrollments(
  student_id INT,
  course_id INT,
  enrollment_time TIMESTAMP DEFAULT now(),
  PRIMARY KEY(student_id, course_id),
  FOREIGN KEY(student_id) REFERENCES students(id),
  FOREIGN KEY(course_id) REFERENCES courses(id)
);

-- This creates some data for our teachers table
INSERT INTO teachers (first_name, last_name, email, phone, office) VALUES
("Viona", "Kimball", "Viona.Kimball@email.com", "987654", "C2-11"),
("Rona", "Albinson", "Rona.Albinson@email.com", "31235225", "C2-11"),
("Perlie", "Harford", "Perlie.Harford@email.com", "5334523", "C2-11"),
("Hester", "Kerry", "Hester.Kerry@email.com", "003589876542321", "C2-11"),
("Smith", "Edwardson", "Smith.Edwardson@email.com", "+358123456789", "C2-11");

INSERT INTO subjects (subject_name, credits) VALUES
("Databases", 4),
("Version control", 4),
("Project", 7);

INSERT INTO courses (teacher_id, start_date, end_date, subject_id) VALUES
(1, "2022-01-10", "2022-02-28", 1),
(2, "2022-01-10", "2022-02-28", 2),
(3, "2022-01-10", "2022-05-15", 3),
(NULL, "2023-01-10", "2023-02-28", 1);

INSERT INTO enrollments(student_id, course_id) VALUES
(121212, 1),
(121212, 2),
(121212, 3),
(123123, 1),
(123123, 2),
(768975, 1),
(768975, 3),
(332233, 3);

SELECT teachers.first_name, teachers.last_name, subjects.subject_name
FROM teachers
INNER JOIN courses ON teachers.id = courses.teacher_id
INNER JOIN subjects ON courses.subject_id = subjects.id;

SELECT teachers.id, teachers.first_name, teachers.last_name, courses.id
FROM teachers
INNER JOIN courses ON teachers.id = courses.teacher_id;

SELECT teachers.id AS "Teacher ID", teachers.first_name, teachers.last_name, courses.id AS "Course ID"
FROM teachers
LEFT JOIN courses ON teachers.id = courses.teacher_id;

SELECT teachers.id AS "Teacher ID", teachers.first_name, teachers.last_name, courses.id AS "Course ID"
FROM teachers
RIGHT JOIN courses ON teachers.id = courses.teacher_id;

-- SQL Functions
SELECT COUNT(students.id) AS "Student count"
FROM students;

SELECT AVG(subjects.credits) AS "Average credits"
FROM subjects;

SELECT SUM(subjects.credits) AS "Total credits"
FROM subjects;

SELECT subjects.subject_name as "Subject", COUNT(student_id) AS "Student count", YEAR(courses.start_date) AS year
FROM enrollments
INNER JOIN courses ON enrollments.course_id = courses.id
INNER JOIN subjects ON courses.subject_id = subjects.id
GROUP BY courses.id
HAVING year = 2022;