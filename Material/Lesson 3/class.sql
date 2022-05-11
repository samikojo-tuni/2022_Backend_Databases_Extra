SELECT subjects.subject_name as "Subject", COUNT(student_id) AS "Student count", YEAR(courses.start_date) AS year
FROM enrollments
INNER JOIN courses ON enrollments.course_id = courses.id
INNER JOIN subjects ON courses.subject_id = subjects.id
GROUP BY courses.id
HAVING year = 2022
ORDER BY year;