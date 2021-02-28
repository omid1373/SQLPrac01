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
	TermId int,
	CreatedAt datetime null,
	UpdatedAt datetime null,
	CONSTRAINT FK_CTCourseId FOREIGN KEY (CourseId)
    REFERENCES MYDB.dbo.courses(CourseId),
    CONSTRAINT FK_CTExamID FOREIGN KEY (TermId)
    REFERENCES MYDB.dbo.terms(TermId)
)
go
Create table student_courses(
	StudentCourseId int identity(1,1) PRIMARY KEY not null,
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
	CourseExamId int identity(1,1) PRIMARY KEY not null,
	CourseTermId int,
	ExamId int,
	CreatedAt datetime null,
	UpdatedAt datetime null,
	CONSTRAINT FK_CEExamID FOREIGN KEY (ExamId)
    REFERENCES MYDB.dbo.exams(ExamId),
    CONSTRAINT FK_CECourseID FOREIGN KEY (CourseTermId)
    REFERENCES MYDB.dbo.course_terms(CourseTermId)
)
go
Create table student_scores(
	StudentScoreId int identity(1,1) PRIMARY KEY not null,
	StudentCourseId int,
	CourseExamId int,
	Grade grade,
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
	TeacherId int,
	CourseId int,
	CreatedAt datetime null,
	UpdatedAt datetime null,
	CONSTRAINT FK_TCTeacherID FOREIGN KEY (TeacherId)
    REFERENCES MYDB.dbo.teachers(TeacherId),
    CONSTRAINT FK_TCCourseID FOREIGN KEY (CourseId)
    REFERENCES MYDB.dbo.courses(CourseId)
)
go

create index ind_year on terms(year);
create index ind_credit on courses(credit);