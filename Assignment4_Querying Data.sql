#Creating database population
create database population;

use population;

#Creating table Country
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

#creating table Persons
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
    
-- 1.List the distinct country names from the Persons table:
    SELECT DISTINCT Country_name FROM Persons;
    
-- 2.Select first names and last names from the Persons table with aliases:
    SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;
    
-- 3.Find all persons with a rating greater than 4.0:
    SELECT * FROM Persons WHERE Rating > 4.0;
    
-- 4.Find countries with a population greater than 10 lakhs (1 million):
    SELECT * FROM Country WHERE Population > 1000000;
    
-- 5.Find persons who are from 'USA' or have a rating greater than 4.5:
    SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
    
-- 6.Find all persons where the country name is NULL:
    SELECT * FROM Persons WHERE Country_name IS NULL;

-- 7.Find all persons from the countries 'USA', 'Canada', and 'UK':
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

-- 8.Find all persons not from the countries 'India' and 'Australia':
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

-- 9.Find all countries with a population between 5 lakhs (500,000) and 20 lakhs (2,000,000):
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

-- 10.Find all countries whose names do not start with 'C':
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';















