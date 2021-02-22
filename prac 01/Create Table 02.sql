Create table school_teachers(
	id int identity(1,1) PRIMARY KEY not null,
	school_id int,
	teacher_id int,
	created_at datetime null,
	updated_at datetime null
	CONSTRAINT FK_STSchoolID FOREIGN KEY (school_id)
    REFERENCES MYDB.dbo.schools(id),
    CONSTRAINT FK_STTeacherID FOREIGN KEY (teacher_id)
    REFERENCES MYDB.dbo.teachers(id)
)
go
Create table student_courses(
	id int identity(1,1) PRIMARY KEY not null,
	student_id int,
	course_id int,
	created_at datetime null,
	updated_at datetime null,
	CONSTRAINT FK_SCStudentID FOREIGN KEY (student_id)
    REFERENCES MYDB.dbo.students(id),
    CONSTRAINT FK_SCCourseID FOREIGN KEY (course_id)
    REFERENCES MYDB.dbo.courses(id)
)
go
Create table course_exams(
	id int identity(1,1) PRIMARY KEY not null,
	course_id int,
	exam_id int,
	created_at datetime null,
	updated_at datetime null,
	CONSTRAINT FK_CEExamID FOREIGN KEY (exam_id)
    REFERENCES MYDB.dbo.exams(id),
    CONSTRAINT FK_CECourseID FOREIGN KEY (course_id)
    REFERENCES MYDB.dbo.courses(id)
)
go
Create table student_scores(
	id int identity(1,1) PRIMARY KEY not null,
	student_course_id int,
	course_exam_id int,
	grade int not null,
	created_at datetime null,
	updated_at datetime null,
	CONSTRAINT FK_StudentCourseID FOREIGN KEY (student_course_id)
    REFERENCES student_courses(id),
    CONSTRAINT FK_CourseExamID FOREIGN KEY (course_exam_id)
    REFERENCES course_exams(id)
)
go
Create table teacher_courses(
	id int identity(1,1) PRIMARY KEY not null,
	teaeher_id int,
	course_id int,
	created_at datetime null,
	updated_at datetime null,
	CONSTRAINT FK_TCTeacherID FOREIGN KEY (teaeher_id)
    REFERENCES MYDB.dbo.teachers(id),
    CONSTRAINT FK_TCCourseID FOREIGN KEY (course_id)
    REFERENCES MYDB.dbo.courses(id)
)
go