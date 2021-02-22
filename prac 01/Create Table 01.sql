--select CAST(GETDATE() AS DATE)
Create table schools(
	id int identity(1,1) PRIMARY KEY not null,
	name varchar(30) null,
	address varchar(100) null,
	contact_number varchar(12) null,
	yeaR varchar(4) null,
	principal varchar(30) null,
	created_at datetime null,
	updated_at datetime null
)
go
Create table students(
	id int identity(1,1) PRIMARY KEY not null,
	school_id int,
	first_name varchar(30) null,
	last_name varchar(30) null,
	phone_number varchar(12) null,
	CONSTRAINT FK_SchoolID FOREIGN KEY (school_id)
    REFERENCES schools(id),
	created_at datetime null,
	updated_at datetime null
)
go 
Create table courses(
	id int identity(1,1) PRIMARY KEY not null,
	name varchar(30) null,
	book varchar(30) null,
	term varchar(12) null,
	created_at datetime null,
	updated_at datetime null
)
go
Create table exams(
	id int identity(1,1) PRIMARY KEY not null,
	ex_type varchar(30) null,
	created_at datetime null,
	updated_at datetime null
)
go
Create table teachers(
	id int identity(1,1) PRIMARY KEY not null,
	first_name varchar(30) null,
	last_name varchar(30) null,
	created_at datetime null,
	updated_at datetime null
)