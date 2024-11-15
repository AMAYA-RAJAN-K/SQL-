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

-- 1. Write an SQL query to print the first three characters of Country_name from the Country table
SELECT LEFT(Country_name, 3) AS Short_Country
FROM Country;

-- 2. Write an SQL query to concatenate first name and last name from Persons table.
SELECT CONCAT(Fname,' ',Lname ) AS Full_name FROM Persons;

-- 3. Write an SQL query to count the number of unique country names from Persons table. 
SELECT COUNT(DISTINCT Country_name) FROM Persons;
     
-- 4. Write a query to print the maximum population from the Country table. 
 SELECT MAX(Population)  AS Max_Population FROM Country;
 
-- 5. Write a query to print the minimum population from Persons table
 SELECT MIN(Population)  AS Min_Population FROM Persons;
 
-- 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
    (11, 'Anna',NULL, 3310000, 4.6, 1, 'USA'),
    (12, 'Daya',NULL, 377421, 3.8, 2, 'Canada');
    
SELECT COUNT(Lname) AS Conut_of_Lname FROM Persons;
    
-- 7. Write a query to find the number of rows in the Persons table.
SELECT COUNT(*) AS Conut_of_Rows FROM Persons;

-- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)
SELECT Country_name AS Country_Name, Population AS Population FROM Country LIMIT 3;

-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

-- 10. List all persons ordered by their rating in descending order. 
SELECT * FROM Persons ORDER BY Rating DESC;

-- 11. Find the total population for each country in the Persons table. 
SELECT Country_name, SUM(Population) AS Total_population FROM Persons GROUP BY Country_name;

-- 12. Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS Total_population FROM Persons GROUP BY Country_name HAVING Total_population>50000;

-- 13. List the total number of persons and average rating for each country,
-- but only for countries with more than 2 persons, ordered by the average rating in ascending order.
SELECT * FROM Persons;

SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name HAVING COUNT(*)> 2
ORDER BY Average_Rating ASC;

-- countries with more than 1 person, ordered by the average rating in ascending order
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name HAVING COUNT(*) > 1
ORDER BY Average_Rating ASC;




 





