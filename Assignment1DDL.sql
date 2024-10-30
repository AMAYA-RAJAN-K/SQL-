create database School;
use School;
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
    (1, 'Amaya', 90, 'A'),
    (2, 'Anusree', 72, 'B'),
    (3, 'Abhay', 60, 'C'),
    (4, 'Akshay', 85, 'A');
    select * from STUDENT;
    
    ALTER TABLE STUDENT
ADD Contact VARCHAR(15);

ALTER TABLE STUDENT
DROP COLUMN Grade;

ALTER TABLE STUDENT
RENAME TO CLASSTEN;

DROP TABLE CLASSTEN;




