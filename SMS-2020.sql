USE SMS_2020
GO 
CREATE TABLE Student
(
	StudentID  INT NOT NULL,
	FName VARCHAR(50),
	LName VARCHAR(50),
	DoB DATETIME ,
	Department INT,
	Gender CHAR(1) 
	CONSTRAINT PK_Student PRIMARY KEY (StudentID) ,
)
--SP_RENAME 'Student.[Student.DepartmentID]','DepartmentID','COLUMN'

--ALTER TABLE Student 
--  ADD CONSTRAINT FK_Student_Department FOREIGN  KEY (DepartmentID) REFERENCES Department(DepartmentID)
--  ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE Semester
(
	SemesterID INT NOT NULL ,
	SemesterName varchar(50),
	[Year] INT 
)
--ALTER TABLE Semester DROP  CONSTRAINT   FK_Semester
--ALTER TABLE Semester ADD CONSTRAINT PK_Semester PRIMARY KEY (SemesterID)
CREATE   TABLE Grade
(
	--CoNo VARCHAR (10) NOT NULL ,
	StudentID INT  NOT NULL,
	SemesterID INT NOT NULL ,
	Mark INT ,
	--CONSTRAINT PK_Grade PRIMARY KEY (CoNo),
	CONSTRAINT FK_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE  CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_Semester FOREIGN KEY (SemesterID) REFERENCES Semester(SemesterID) ON DELETE  CASCADE ON UPDATE CASCADE
)
--ALTER TABLE Grade 
--  ADD CONSTRAINT FK_Grade_cource FOREIGN  KEY (coNo) REFERENCES Course(coNo)
--  ON DELETE CASCADE ON UPDATE CASCADE;
--	ALTER TABLE Grade
--	drop  PK_Grade  
--	ALTER TABLE Grade
--	add CONSTRAINT PK_Grade  PRIMARY KEY (CoNo,StudentID,SemesterID)
--select * from Grade
CREATE TABLE Course 
 (
	coNo VARCHAR(10) NOT NULL,
	coTitle VARCHAR(50)	,
	CrHr int,
	CONSTRAINT pk_cource  PRIMARY KEY (CoNo)
 )
CREATE TABLE HighestEducationLevel
 (
	EducationLevelID INT  NOT NULL ,
	EducationLevel VARCHAR(50)
 )
 --ALTER TABLE HighestEducationLevel ADD CONSTRAINT PK_HighestEducationLevel PRIMARY KEY (EducationLevelID) 
CREATE TABLE Faculty
 (
	FacultyID INT NOT NULL ,
	FacultyName VARCHAR(50)
	CONSTRAINT PK_Faculty PRIMARY KEY (FacultyID)
 )
CREATE TABLE Department
 (
	DepartmentID INT NOT NULL ,
	DepartmentName VARCHAR(50),
	FacultyID int ,
	CONSTRAINT PK_Department PRIMARY KEY (DepartmentID),
	CONSTRAINT  FK_Faculty FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID) ON DELETE CASCADE ON UPDATE CASCADE ,
	 )

CREATE TABLE Instractor 
(
	InstractorID INT NOT NULL , 
	FName VARCHAR(50)  ,
	LName VARCHAR(50)  ,
	Gender CHAR(1),
	DepartmentID INT ,
	EducationLevelID INT ,
	DoB DATETIME ,
	ReportTo INT ,
	CONSTRAINT PK_Instractor PRIMARY KEY (InstractorID),
	CONSTRAINT FK_Department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_EducationLevel FOREIGN KEY (EducationLevelID) REFERENCES HighestEducationLevel (EducationLevelID) ON DELETE CASCADE ON UPDATE CASCADE,
)
CREATE TABLE InstructorCourse 
(
	coNo VARCHAR(10) NOT NULL,
	InstractorID int NOT NULL, 
	SemesterID int NOT NULL,
	[Description] NVARCHAR(MAX) NULL ,
	CONSTRAINT FK_cource FOREIGN  KEY (coNo) REFERENCES Course (coNo) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_Instractor FOREIGN  KEY (InstractorID) REFERENCES  Instractor (InstractorID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_Semester_Instructor FOREIGN KEY (SemesterID) REFERENCES Semester(SemesterID) ON DELETE CASCADE ON UPDATE CASCADE,
)
/*Assigment
1 add the following fields on student table 
  Address,City,State ,ZipCode,Contry 
*/ 
ALTER TABLE Student 
ADD  [Address] VARCHAR(20), 
	 [City] VARCHAR (20),
	 [State] VARCHAR (10),
	 [ZipCode] VARCHAR (10),
	 [Country]  VARCHAR(10)
			 
			 /*
2 Remove Country Column from student table 
 */
 ALTER TABLE Student 
 DROP COLUMN  [Country]   
 /*
3 create the following table 
*/
CREATE TABLE  TestTable 
	(
		ID INT PRIMARY KEY ,
		NAME VARCHAR(50)
	)
 /*
 4 Rename  this table to testYayobe
 */
 EXEC SP_RENAME  'TestTable' ,'testYayobe'
 SELECT * FROM TestTable
 /*
 5 drop the table 
 */
 DROP TABLE testYayobe
 /*
 6 Insert recordes to department , student , cource , semister 
 Grade tables  		 
 */

SELECT * FROM Faculty
TRUNCATE TABLE    Faculty --Cannot truncate table 'Faculty' because it is being referenced by a FOREIGN KEY constraint.
DELETE   Faculty

INSERT   Faculty VALUES 
(1	,'Faculty of Architecture and History of Art'),
(2	,'Faculty of Asian and Middle Eastern Studies'),
(3,	'Faculty of Classics'),
(4,	'Faculty of Divinity'),
(5	,'Faculty of English')


SELECT * FROM Department
INSERT INTO Department
VALUES
	(1	,'Architecture',1),
	(2	,'History of Art',1),
	(3	,'East Asian Studies',2),
	(4	,'Middle Eastern Studies',2),
	(5	,'Museum of Classical Archaeology',3)

--update  Semester
--set SemesterName = 'First ' where SemesterName ='Firist'
INSERT INTO Semester
VALUES  
--(1 , 'Firist' , 2015),
(2 , 'Second' , 2015),
(3 , 'summer' , 2015),
(4 , 'Firist' , 2016),
(5 , 'Second' , 2017),
(6 , 'summer' , 2018)

INSERT INTO Course
VALUES 
--('csc 105', 'computer programming ', 3),
('csc 102', 'computer programming II' , 4),
('csc 100', 'computer programming I', 4),
('csc 105', 'computer programming', 2)

 INSERT INTO Student 
 VALUES 
  ('002', 'solomon', 'negash', '12/12/1990', 3,
  'M','FALL manor dr ', 'Richardeson','Tx', '7220'),
    ('003', 'Taye', 'Asmelash', '12/12/1950', 4,
  'M','FALL manor dr ', 'Richardeson','Tx', '7220')

INSERT INTO  Grade 
VALUES 
( 'CSC 102',001,1,90)
( 'CSC 100',001,1,80)