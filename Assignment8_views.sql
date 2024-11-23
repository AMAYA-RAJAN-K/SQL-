#creating database
CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES 
(1, 'Alice', 'Smith', 'alice.smith@example.com', '1234567890', '123 Elm St', 'New York', 'New York', '10001', 'US'),
(2, 'Dayana', 'Johnson', 'dayana.johnson@example.com', '2345678901', '456 Maple Ave', 'London', 'Greater London', 'SW1A 1AA', 'UK'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '3456789012', '789 Oak Dr', 'Toronto', 'Ontario', 'M5H 2N2', 'Canada'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '4567890123', '101 Pine Rd', 'Sydney', 'New South Wales', '2000', 'Australia'),
(5, 'Amal', 'Krishnan', 'amal.krishnan@example.com', '5678901234', '202 Birch Ln', 'Mumbai', 'Maharashtra', '400001', 'India'),
(6, 'Eva', 'George', 'eva.george@example.com', '6789012345', '303 Cedar Pl', 'Berlin', 'Berlin', '10115', 'Germany'),
(7, 'John', 'Taylor','john.taylor@example.com', '7890123456', '404 Palm Ct', 'Paris', 'Île-de-France', '75001', 'France'),
(8, 'Hari', 'Thomas', 'hari.thomas@example.com', '8901234567', '505 Spruce Blvd', 'Tokyo', 'Tokyo Prefecture', '100-0001', 'Japan'),
(9, 'James', 'White', 'james.white@example.com', '9012345678', '606 Fir Ave', 'Cape Town', 'Western Cape', '8001', 'South Africa'),
(10, 'Chris', 'Evans', 'chris.evans@example.com', '1230984567', '908 Sunset Blvd', 'Los Angeles', 'California', '90001', 'US');

-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
-- Then perform the SELECT operation for the customer_info view.
CREATE VIEW customer_info AS
SELECT CONCAT(First_name,' ',Last_name) AS Full_name, Email FROM Customer;
SELECT * FROM customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US.
CREATE VIEW US_Customers AS
SELECT * FROM Customer WHERE Country = 'US';
SELECT * FROM US_Customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name,' ',Last_name) AS Full_name, Email, Phone_no, State FROM Customer;
SELECT * FROM Customer_details;

--  4. Update phone numbers of customers who live in California for Customer_details view.
UPDATE Customer SET Phone_no = 1023098456 WHERE State = 'California';
SELECT * FROM Customer_details;

--  5. Count the number of customers in each state and show only states with more than 5 customers.
SELECT State, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
SELECT State, COUNT(*) AS Customer_Count
FROM Customer_details
GROUP BY State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT * FROM Customer_details
ORDER BY State ASC;


