--CREATE TABLE Departments
--(
-- Name varchar(20) NOT NULL ,
-- ID char(5) PRIMARY KEY,
-- Budget numeric(12,2),
-- Category varchar(15) Check (Category in
--('Engineering','Science'))

--);

--CREATE TABLE Teachers
--(
-- FirstName varchar(20) NOT NULL,
-- LastName varchar(30) NOT NULL ,
-- ID char(7),
-- BirthYear int,
-- DepartmentID char(5),
-- Salary numeric(7,2) Default 10000.00,
-- PRIMARY KEY (ID),
-- FOREIGN KEY (DepartmentID) REFERENCES Departments(ID),
--);

--CREATE TABLE Students
--(
-- FirstName varchar(20) NOT NULL,
-- LastName varchar(30) NOT NULL ,
-- StudentNumber char(7) PRIMARY KEY,
-- BirthYear int,
-- DepartmentID char(5),
-- AdvisorID char(7),
-- FOREIGN KEY (DepartmentID) REFERENCES Departments(ID),
-- FOREIGN KEY (AdvisorID) REFERENCES Teachers(ID)
--);------------------------ Part 1 of first question--ALTER TABLE Students--	ADD cred int------------------------ Part 2 of first question--CREATE TABLE Courses--(--ID char(10) NOT NULL,--Title varchar(50),--DepartmentID char(5),--Credits numeric(2,0) check (Credits>0),--PRIMARY KEY (ID),--FOREIGN KEY (DepartmentID) REFERENCES Departments(ID),--)--CREATE TABLE Available_Courses--(--CourseID char(10) NOT NULL,--Semester char(30) check (Semester in ('Fall', 'Spring')), --Year numeric(4,0) check (Year > 1300),--ID char(5),--TeacherID char(7),--PRIMARY KEY(ID),--FOREIGN KEY (TeacherID) references Teachers(ID),--FOREIGN KEY (CourseID) references Courses(ID),--)--CREATE TABLE Taken_Courses--(--StudentID char(7) NOT NULL,--CourseID char(10),--Semester char(30) check (Semester in ('Fall', 'Spring')), --Year numeric(4,0) check (Year > 1300),--Grade numeric(4,2),--PRIMARY KEY (CourseID, StudentID, Semester, Year),--FOREIGN KEY (CourseID) references Courses(ID),--FOREIGN KEY (StudentID) references Students(StudentNumber),--)--CREATE TABLE Prerequisites--(--CourseID char(10),--PrereqID char(10),--PRIMARY KEY(CourseID, PrereqID),--FOREIGN KEY (CourseID) references Courses(ID),--FOREIGN KEY (PrereqID) references Courses(ID)--)------------------------ Part 3 of first question--insert into Departments values('Civil Eng.',1,  255041.46, 'Engineering');
--insert into Departments values('Biology',2,  647610.55, 'Science');
--insert into Departments values('Physics',4,  942162.76, 'Engineering');
--insert into Departments values('English',7, 611042.66, 'Science');
--insert into Departments values('Accounting',8, 441840.92, 'Engineering');
--insert into Departments values('Comp. Sci.',9, 106378.69, 'Engineering');
--insert into departments values('Statistics',16,  395051.74, 'Science');
--insert into departments values('Psychology',17,  848175.04, 'Science');
insert into Courses values('353', 'Operating Systems', 9, 3);
insert into Courses values('681', 'Medieval Civilization or Lack Thereof', 7, 3);
insert into Courses values('959', 'Bacteriology', 4, 4);
insert into Courses values('647', 'Service-Oriented Architectures', 9, 4);
insert into Courses values('598', 'Number Theory', 8, 4);
insert into Courses values ('876', 'Data Base', 9, 3);


insert into Teachers values('Ahmad', 'Ahmadi', 133, 1340, 1, 45000);
insert into Teachers values('Saeid', 'Saeidi', 124, 1350, 9, 65000);
insert into Teachers values('Mohamad', 'Mohamadi', 125, 1343, 17, 30000);
insert into Teachers values('Zahra', 'Abtahi', 126, 1355, 8, 40000);
insert into Teachers values('Fatemeh', 'Motamadi', 127, 1363, 7, 20000);



insert into Students values('Asghar', 'Hamidi', '35498', 78, 7, 127, 100);
insert into Students values('fateme', 'Alaei', '55598', 78, 4, 126, 55);
insert into Students values('afrooz', 'Asghari', '11111', 73, 1, 133, 65);
insert into Students values('Ava', 'Sheikh', '22222', 76, 8, 126, 75);
insert into Students values('azam', 'Fazel', '123', 79, 9, 124, 77);



insert into Available_Courses values 
(353, 'Fall', 2020, 111, 124);
insert into Available_Courses values 
(598, 'Spring', 2020, 112, 126);
insert into Available_Courses values 
(681, 'Fall', 2020, 113, 127);



insert into Taken_Courses values
('35498', '353', 'Spring', 2019, 15.5);
insert into Taken_Courses values
('55598', '681', 'Fall', 2019, 16.2);
insert into Taken_Courses values
('11111', '959', 'Spring', 2018, 14);
insert into Taken_Courses values
('22222', '647', 'Spring', 2017, 15);
insert into Taken_Courses values 
('11111', '876', 'Fall', 2016, 11);




