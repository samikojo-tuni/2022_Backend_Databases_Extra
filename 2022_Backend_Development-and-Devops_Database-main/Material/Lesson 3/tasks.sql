-- Lesson task 1:
-- Fetch all the courses which have a teacher assigned to. Include the subject name and teacher's name in the result.
SELECT subjects.subject_name, CONCAT(teachers.first_name, " ", teachers.last_name) as "Teacher's name"
FROM courses
INNER JOIN teachers ON courses.teacher_id = teachers.id
INNER JOIN subjects ON courses.subject_id = subjects.id;

-- Lesson task 2:
-- Fetch all the courses in the database. Include courses without teacher assigned as well.
-- Include the subject name and teacher's name in the result.
SELECT subjects.subject_name, CONCAT(teachers.first_name, " ", teachers.last_name) as "Teacher's name"
FROM courses
LEFT JOIN teachers ON courses.teacher_id = teachers.id
INNER JOIN subjects ON courses.subject_id = subjects.id;

-- Lesson task 3:
-- Fetch all the students who are taking part on any course in 2022.
-- Include students' name and id in the result set.
-- Include each student only once even if they have enrolled on multiple courses.
SELECT DISTINCT students.id, students.first_name, students.last_name
FROM students
INNER JOIN enrollments ON enrollments.student_id = students.id
INNER JOIN courses ON courses.id = enrollments.course_id
WHERE courses.start_date >= "2022-01-01";

SELECT DISTINCT students.id, students.first_name, students.last_name
FROM students
INNER JOIN enrollments ON enrollments.student_id = students.id
INNER JOIN courses ON courses.id = enrollments.course_id
WHERE YEAR(courses.start_date) >= 2022;

-- Lesson task 4:
-- Fetch all courses which are implemented on 2022. Include subject's name and teacher's name in the result set.
SELECT subjects.subject_name, teachers.first_name, teachers.last_name
FROM courses
LEFT JOIN teachers ON courses.teacher_id = teachers.id
INNER JOIN subjects ON subjects.id = courses.subject_id
WHERE courses.start_date >= "2023-01-01" AND courses.end_date <= "2023-12-31";