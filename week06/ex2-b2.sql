SELECT tmp.school, book, teacher, minLoanDates.loanDate FROM
(SELECT school, MAX(loanDate) as loanDate
FROM teachers
INNER JOIN "teacher-course-book" ON "teacher-course-book".teacher = teachers.teacher
GROUP BY school) as minLoanDates
INNER JOIN (
	SELECT DISTINCT teachers.teacher, loanDate, school, book FROM 
	"teacher-course-book"
	INNER JOIN teachers ON "teacher-course-book".teacher = teachers.teacher
	) as tmp
ON tmp.loanDate = minLoanDates.loanDate AND minLoanDates.school = tmp.school
ORDER BY school;