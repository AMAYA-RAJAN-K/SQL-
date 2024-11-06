#creating database
create database School;

use School;
#creating table STUDENT
  CREATE TABLE STUDENT (
     Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
); 
-- insering values in STUDENT
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
    (1, 'Amaya', 90, 'A'),
    (2, 'Anusree', 72, 'B'),
    (3, 'Abhay', 60, 'C'),
    (4, 'Akshay', 85, 'A');
    
    select * from STUDENT;
-- adding column Contact
    ALTER TABLE STUDENT
ADD Contact VARCHAR(15);
select * from STUDENT;

-- droping column Grade
ALTER TABLE STUDENT
DROP COLUMN Grade;
select * from STUDENT;

-- renaming table STUDENT to CLASSTEN
ALTER TABLE STUDENT
RENAME TO CLASSTEN;

-- deleting all rows feom the table
TRUNCATE TABLE CLASSTEN;
select * from CLASSTEN;

-- droping table CLASSTEN
DROP TABLE CLASSTEN;




