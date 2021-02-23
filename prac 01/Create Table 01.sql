--select CAST(GETDATE() AS DATE)
use MYDB
go

Create table schools(
	SchoolId int identity(1,1) PRIMARY KEY not null,
	Name nvarchar(30) null,
	Address nvarchar(100) null,
	ContactNumber nvarchar(12) null,
	year nvarchar(4) null,
	Principal nvarchar(30) null,
	CreatedAt datetime null,
	UpdatedAt datetime null
)
go
Create table students(
	StudentId int identity(1,1) PRIMARY KEY not null,
	SchoolId int,
	NationalId nvarchar(10) UNIQUE,
	FirstName nvarchar(30) null,
	LastName nvarchar(30) null,
	PhoneNumber nvarchar(12) null,
	CreatedAt datetime null,
	UpdatedAt datetime null
	CONSTRAINT FK_SchoolID FOREIGN KEY (SchoolId)
    REFERENCES schools(SchoolId),
)
go
Create table courses(
	CourseId int identity(1,1) PRIMARY KEY not null,
	Name nvarchar(30) null,
	Book nvarchar(30) null,
	Credit int default 1,
	CreatedAt datetime null,
	UpdatedAt datetime null
)
go
Create table terms(
	TermID int identity(1,1) PRIMARY KEY not null,
	TermNumber int default 1,
	Year int default 1400,
)
go
Create table exams(
	ExamID nvarchar(30) PRIMARY KEY not null,
)
go
Create table teachers(
	TeacherId int identity(1,1) PRIMARY KEY not null,
	FirstName nvarchar(30) null,
	LastName nvarchar(30) null,
	CreatedAt datetime null,
	UpdatedAt datetime null
)