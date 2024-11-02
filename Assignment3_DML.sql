#creating database Employees
create database employees; 

#Using the database
use Employees;

#creating Managers table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE,
    Age INT CHECK (Age >= 18),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

#Inserting 10 rows
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
    (1, 'Amaya', 'Rajeesh', '1980-06-15', 43, 'F', 'IT', 36000.00),
    (2, 'Boby', 'John', '1975-09-20', 48, 'M', 'Finance', 25000.00),
    (3, 'Amal', 'Jith', '1985-12-05', 38, 'M', 'IT', 26000.00),
    (4, 'Divin', 'Prasad', '1990-11-25', 33, 'M', 'Marketing', 28000.00),
    (5, 'Aaliya', 'Mathew', '1978-01-10', 46, 'F', 'HR', 27000.00),
    (6, 'Hari', 'Kumar', '1983-03-18', 41, 'M', 'IT', 32000.00),
    (7, 'Gayathri', 'Devi', '1988-07-22', 35, 'F', 'Finance', 23000.00),
    (8, 'Deepthi', 'Thomas', '1982-04-30', 42, 'F', 'Sales', 24000.00),
    (9, 'Eva', 'Sharon', '1992-08-14', 31, 'F', 'IT', 35000.00),
    (10, 'Abhay', 'Krishna', '1986-10-06', 37, 'M', 'Logistics', 29000.00);
    
    #selecting the name and date of birth of the manager with Manager_Id = 1
    SELECT First_name, Last_Name, DOB FROM Managers
WHERE Manager_Id = 1;

#selecting the annual income of all managers
SELECT First_name, Last_Name, Salary * 12 AS Annual_Income
FROM Managers;

#selecting the records of all managers except 'Aaliya'
SELECT * FROM Managers
WHERE First_name != 'Aaliya';

#selecting details of managers whose department is 'IT' and earns more than 25000 per month
SELECT * FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

#selecting details of managers whose salary is between 10000 and 35000
SELECT * FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;




