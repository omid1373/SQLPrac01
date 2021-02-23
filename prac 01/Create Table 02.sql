use MYDB
go
Create table school_teachers(
	SchoolTeacherId int identity(1,1) PRIMARY KEY not null,
	SchoolId int,
	TeacherId int,
	CreatedAt datetime null,
	UpdatedAt datetime null,
	CONSTRAINT FK_STSchoolID FOREIGN KEY (SchoolId)
    REFERENCES MYDB.dbo.schools(SchoolId),
    CONSTRAINT FK_STTeacherID FOREIGN KEY (TeacherId)
    REFERENCES MYDB.dbo.teachers(TeacherId)
)
go
Create table course_terms(
	CourseTermId int identity(1,1) PRIMARY KEY not null,
	CourseId int,
	ExamId int,
	CreatedAt datetime null,
	UpdatedAt datetime null,
	CONSTRAINT FK_CECourseId FOREIGN KEY (CourseId)
    REFERENCES MYDB.dbo.courses(CourseId),
    CONSTRAINT FK_CEExamID FOREIGN KEY (ExamId)
    REFERENCES MYDB.dbo.exams(ExamId)
)
go
Create table student_courses(
	StudentCourseID int identity(1,1) PRIMARY KEY not null,
	StudentId int,
	CourseTermId int,
	CreatedAt datetime null,
	UpdatedAt datetime null,
	CONSTRAINT FK_SCStudentID FOREIGN KEY (StudentId)
    REFERENCES MYDB.dbo.students(StudentId),
    CONSTRAINT FK_SCCourseID FOREIGN KEY (CourseTermId)
    REFERENCES MYDB.dbo.course_terms(CourseTermId)
)
go
Create table course_exams(
	CourseExamID int identity(1,1) PRIMARY KEY not null,
	CourseId int,
	ExamId int,
	CreatedAt datetime null,
	UpdatedAt datetime null,
	CONSTRAINT FK_CEExamID FOREIGN KEY (ExamId)
    REFERENCES MYDB.dbo.exams(ExamId),
    CONSTRAINT FK_CECourseID FOREIGN KEY (CourseId)
    REFERENCES MYDB.dbo.courses(CourseId)
)
go
Create table student_scores(
	StudentScoreID int identity(1,1) PRIMARY KEY not null,
	StudentCourseId int,
	CourseExamId int,
	Grade int not null,
	CreatedAt datetime null,
	UpdatedAt datetime null,
	CONSTRAINT FK_StudentCourseID FOREIGN KEY (StudentCourseId)
    REFERENCES student_courses(StudentCourseId),
    CONSTRAINT FK_CourseExamID FOREIGN KEY (CourseExamId)
    REFERENCES course_exams(CourseExamId)
)
go
Create table teacher_courses(
	TeacherCourseId int identity(1,1) PRIMARY KEY not null,
	TeaeherId int,
	CourseId int,
	CreatedAt datetime null,
	UpdatedAt datetime null,
	CONSTRAINT FK_TCTeacherID FOREIGN KEY (TeaeherId)
    REFERENCES MYDB.dbo.teachers(TeaeherId),
    CONSTRAINT FK_TCCourseID FOREIGN KEY (CourseId)
    REFERENCES MYDB.dbo.courses(CourseId)
)
go