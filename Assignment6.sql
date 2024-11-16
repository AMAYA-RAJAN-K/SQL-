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

-- 1. Perform inner join, Left join, and Right join on the tables.
# INNER JOIN 
SELECT p.Id AS Person_ID, p.Fname, p.Lname, p.Rating, c.Country_name, c.Population 
FROM Persons p INNER JOIN Country c ON p.Country_Id = c.Id ;

# LEFT JOIN 
SELECT p.Id AS Person_ID, p.Fname, p.Lname, p.Rating, c.Country_name, c.Population 
FROM Persons p LEFT JOIN Country c ON p.Country_Id = c.Id ;

# RIGHT JOIN 
SELECT p.Id AS Person_Id, p.Fname, p.Lname, p.Rating, c.Country_name, c.Population
FROM Persons p RIGHT JOIN Country c ON p.Country_Id = c.Id;

-- 2. List all distinct country names from both the Country and Persons tables.
SELECT DISTINCT Country_name FROM Country UNION SELECT DISTINCT Country_name FROM Persons;

-- 3. List all country names from both the Country and Persons tables, including duplicates.
SELECT Country_name FROM Country UNION ALL SELECT Country_name FROM Persons;

-- 4. Round the ratings of all persons to the nearest integer in the Persons table.
SELECT Id, Fname, Lname, ROUND(Rating, 0) AS Rounded_Rating, Country_name FROM Persons;



