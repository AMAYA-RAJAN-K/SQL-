#creating database Country
create database Country;
use Country;

# creating table Country
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

# creating table Persons
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2,1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

#inserting Data into Country
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
    (1, 'USA', 331000, 98335),
    (2, 'Canada', 377421, 99846),
    (3, 'UK', 678860, 2436),
    (4, 'India', 13800000, 32872),
    (5, 'Australia', 254998, 76920),
    (6, 'Germany', 837839, 3570),
    (7, 'France', 652735, 5516),
    (8, 'Brazil', 2125594, 85157),
    (9, 'Japan', 1264764, 3779),
    (10, 'Russia', 1459344, 170982);
    select * from Country;
    
#inserting Data into Persons
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
    (1, 'Alice', 'Smith', 3310000, 4.6, 1, 'USA'),
    (2, 'Dayana', 'Johnson', 377421, 3.8, 2, 'Canada'),
    (3, 'Charlie', 'Brown', 678860, 4.2, 3, 'UK'),
    (4, 'Amal', 'Krishnan', 13800000, 4.9, 4, 'India'),
    (5, 'Eva', 'George', 254998, 3.5, 5, 'Australia'),
    (6, 'John', 'Taylor', 837839, 4.7, 6, 'Germany'),
    (7, 'Grace', 'Antony', 652735, 2.9, 7, 'France'),
    (8, 'Hari', 'Thomas', 2125594, 4.8, 8, 'Brazil'),
    (9, 'Johny', 'White', 1264764, 3.2, 9, 'Japan'),
    (10, 'Jack', 'Davis', 1459344, 4.4, 10, 'Russia');
    select * from Persons;
    
-- 1. Add a new column called DOB in Persons table with data type as Date. 
ALTER TABLE Persons ADD COLUMN DOB date;

UPDATE Persons SET DOB = '1985-03-15' WHERE Id = 1;
UPDATE Persons SET DOB = '1990-07-10' WHERE Id = 2;
UPDATE Persons SET DOB = '1995-01-25' WHERE Id = 3;
UPDATE Persons SET DOB = '1988-12-05' WHERE Id = 4;
UPDATE Persons SET DOB = '1992-09-20' WHERE Id = 5;
UPDATE Persons SET DOB = '1980-11-11' WHERE Id = 6;
UPDATE Persons SET DOB = '1993-04-18' WHERE Id = 7;
UPDATE Persons SET DOB = '1986-06-22' WHERE Id = 8;
UPDATE Persons SET DOB = '1991-02-14' WHERE Id = 9;
UPDATE Persons SET DOB = '1984-08-30' WHERE Id = 10;
SELECT * FROM Persons;

-- 2. Write a user-defined function to calculate age using DOB
DELIMITER //
CREATE FUNCTION CalculateAge(dob DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END;
//
DELIMITER ;

-- 3. Write a select query to fetch the Age of all persons using the function that has been created.
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

--  4. Find the length of each country name in the Country table. 
SELECT Country_name, LENGTH(Country_name) AS Name_length FROM Country;

-- 5. Extract the first three characters of each country's name in the Country table.
SELECT Country_name, SUBSTRING(Country_name,1,3) AS First_three FROM Country;

-- 6. Convert all country names to uppercase and lowercase in the Country table.

 SELECT Country_name, UCASE(Country_name) AS Upper_case, LCASE(Country_name) AS Lower_case FROM Country;


