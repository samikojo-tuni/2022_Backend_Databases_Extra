-- First create all the tables.
CREATE TABLE students(
  id INT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  birth_year YEAR);

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

-- Then we populate tables with data.
INSERT INTO students(id, first_name, last_name, birth_year) VALUES
  (123123, "Madalyn", "Matthewson", 1990),
  (121212, "Liz", "Doctor", 1995),
  (987654, "Mack", "Garbutt", 1999),
  (654893, "Alesha", "Hoggard", 2002),
  (332233, "Margaret", "Hightower", 2001),
  (223344, "Pat", "Burnham", 2000),
  (768975, "Anderson", "Wyatt", 2002),
  (446688, "Bryn", "Savage", 1995),
  (997755, "Tawnee", "Seymour", 1992),
  (421789, "Permelia", "Lamb", 1998);

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

