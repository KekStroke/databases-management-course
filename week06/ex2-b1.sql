SELECT school, COUNT(*)
FROM "teacher-course-book"
INNER JOIN teachers ON teachers.teacher = "teacher-course-book".teacher
GROUP BY school