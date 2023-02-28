CREATE TABLE books
	(book VARCHAR(100),
	 publisher VARCHAR(100),
	 PRIMARY KEY (book)
	);

CREATE TABLE teachers
	(teacher VARCHAR(100),
	 school VARCHAR(100),
	 room VARCHAR(100),
	 PRIMARY KEY (teacher)
	);

CREATE TABLE "teacher-course-book"
	(teacher VARCHAR(100),
	 course VARCHAR(100),
	 grade VARCHAR(100),
	 book VARCHAR(100),
	 loanDate DATE,
	 PRIMARY KEY (teacher, course, book),
	 FOREIGN KEY (teacher) REFERENCES teachers (teacher),
	 FOREIGN KEY (book) REFERENCES books (book)
	);
	
INSERT INTO books VALUES ('Learning and teaching in early childhood education', 'BOA Editions');
INSERT INTO books VALUES ('Preschool, N56', 'Taylor & Francis Publishing');
INSERT INTO books VALUES ('Early Childhood Education N9', 'Prentice Hall');
INSERT INTO books VALUES ('Know how to educate: guide for Parents and Teachers', 'McGraw Hill');

INSERT INTO teachers VALUES ('Chad Russell', 'Horizon Education Institute', '1.A01');
INSERT INTO teachers VALUES ('E.F.Codd', 'Horizon Education Institute', '1.B01');
INSERT INTO teachers VALUES ('Jones Smith', 'Horizon Education Institute', '1.A01');
INSERT INTO teachers VALUES ('Adam Baker', 'Bright Institution', '2.A01');

INSERT INTO "teacher-course-book" VALUES ('Chad Russell', 'Logical Thinking', '1st grade', 'Learning and teaching in early childhood education', '2010-09-09');
INSERT INTO "teacher-course-book" VALUES ('Chad Russell', 'Writing', '1st grade', 'Preschool, N56', '2010-05-05');
INSERT INTO "teacher-course-book" VALUES ('Chad Russell', 'Numerical Thinking', '1st grade', 'Learning and teaching in early childhood education', '2010-05-05');
INSERT INTO "teacher-course-book" VALUES ('E.F.Codd', 'Spatial, Temporal and Causal Thinking', '1st grade', 'Early Childhood Education N9', '2010-05-06');
INSERT INTO "teacher-course-book" VALUES ('E.F.Codd', 'Numerical Thinking', '1st grade', 'Learning and teaching in early childhood education', '2010-05-26');
INSERT INTO "teacher-course-book" VALUES ('Jones Smith', 'Writing', '2nd grade', 'Learning and teaching in early childhood education', '2010-09-09');
INSERT INTO "teacher-course-book" VALUES ('Jones Smith', 'English', '2nd grade', 'Know how to educate: guide for Parents and Teachers', '2010-05-05');
INSERT INTO "teacher-course-book" VALUES ('Adam Baker', 'Logical Thinking', '1st grade', 'Know how to educate: guide for Parents and Teachers', '2010-12-18');
INSERT INTO "teacher-course-book" VALUES ('Adam Baker', 'Numerical Thinking', '1st grade', 'Learning and teaching in early childhood education', '2010-05-06');