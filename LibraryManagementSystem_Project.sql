CREATE DATABASE library;
USE library;

#Creating Tables
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(3),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

#Inserting values to the tables
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 201, 'MG Road, Ernakulam', '9876543210'),
(2, 202, 'Kowdiar, Thiruvananthapuram', '9876543220'),
(3, 203, 'Calicut Beach, Kozhikode', '9876543230'),
(4, 204, 'East Fort, Thrissur', '9876543240'),
(5, 205, 'Mananchira, Malappuram', '9876543250');

SELECT * FROM Branch;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
(1001, 'Pride and Prejudice', 'English Literature', 15.75, 'Yes', 'Jane Austen', 'T. Egerton'),
(1002, 'Hamlet', 'English Literature', 14.50, 'Yes', 'William Shakespeare', 'Penguin Classics'),
(1003, 'Wuthering Heights', 'English Literature', 17.50, 'Yes', 'Emily Bronte', 'Thomas Cautley Newby'),
(1004, 'The Catcher in the Rye', 'English Literature', 19.99, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
(1005, 'Animal Farm', 'English Literature', 12.00, 'Yes', 'George Orwell', 'Secker & Warburg'),
(1006, 'Randamoozham', 'Malayalam Literature', 18.00, 'Yes', 'M.T. Vasudevan Nair', 'DC Books'),
(1007, 'Kayar', 'Malayalam Literature', 16.00, 'Yes', 'Thakazhi Sivasankara Pillai', 'Current Books'),
(1008, 'Chemmeen', 'Malayalam Literature', 14.50, 'Yes', 'Thakazhi Sivasankara Pillai', 'Current Books'),
(1009, 'Oru Desathinte Katha', 'Malayalam Literature', 13.99, 'Yes', 'S.K. Pottekkatt', 'National Book Stall'),
(1010, 'Balyakalasakhi', 'Malayalam Literature', 15.00, 'No', 'Vaikom Muhammad Basheer', 'Mathrubhumi Books'),
(1011, 'A Brief History of Time', 'Science', 25.50, 'Yes', 'Stephen Hawking', 'Bantam Books'),
(1012, 'The Selfish Gene', 'Science', 20.00, 'Yes', 'Richard Dawkins', 'Oxford University Press'),
(1013, 'Cosmos', 'Science', 22.00, 'No', 'Carl Sagan', 'Random House'),
(1014, 'The Gene: An Intimate History', 'Science', 28.00, 'Yes', 'Siddhartha Mukherjee', 'Scribner'),
(1015, 'Astrophysics for Young People in a Hurry', 'Science', 15.00, 'Yes', 'Neil deGrasse Tyson', 'Norton Young Readers'),
(1016, 'The Alchemist', 'Fiction', 20.50, 'Yes', 'Paulo Coelho', 'HarperOne'),
(1017, 'To Kill a Mockingbird', 'Fiction', 18.50, 'Yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
(1018, 'The Kite Runner', 'Fiction', 18.50, 'No', 'Khaled Hosseini', 'Riverhead Books'),
(1019, 'The Great Gatsby', 'Fiction', 20.00, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
(1020, 'The Road', 'Fiction', 19.00, 'Yes', 'Cormac McCarthy', 'Knopf'),
(1021, 'Sapiens: A Brief History of Humankind', 'History', 25.00, 'Yes', 'Yuval Noah Harari', 'Harper'),
(1022, 'Guns, Germs, and Steel', 'History', 27.00, 'Yes', 'Jared Diamond', 'W.W. Norton & Company'),
(1023, 'A People’s History of the United States', 'History', 21.00, 'Yes', 'Howard Zinn', 'Harper Perennial'),
(1024, 'The Silk Roads', 'History', 23.00, 'No', 'Peter Frankopan', 'Bloomsbury Publishing'),
(1025, 'The History of the Ancient World', 'History', 24.50, 'Yes', 'Susan Wise Bauer', 'W.W. Norton & Company');

SELECT * FROM Books;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(201, 'Anjali Menon', 'Branch Manager', 75000, 1),
(101, 'Rahul Nair', 'Assistant Manager', 55000, 1),
(102, 'Meera Krishnan', 'Librarian', 45000, 1),
(103, 'Gokul Krishna', 'Assistant Manager', 35000, 1),
(104, 'Varun P', 'Librarian', 42000, 1),
(105, 'Priya Praveen', 'Librarian', 40000, 1),
(202, 'Suresh Kumar', 'Branch Manager', 76000, 2),
(106, 'Arjun Das', 'Assistant Manager', 52000, 2),
(107, 'Lakshmi Pillai', 'Librarian', 48000, 2),
(203, 'Divya Nair', 'Branch Manager', 77000, 3),
(108, 'Vishnu Mohan', 'Assistant Manager', 50000, 3),
(109, 'Ashwin Menon', 'Librarian', 46000, 3),
(204, 'Priya Ramesh', 'Branch Manager', 78000, 4),
(110, 'Kiran Raj', 'Assistant Manager', 54000, 4),
(111, 'Neha Varma', 'Librarian', 47000, 4),
(205, 'Rajesh Pillai', 'Branch Manager', 79000, 5),
(112, 'Amal John', 'Assistant Manager', 53000, 5),
(113, 'Keerthi Menon', 'Librarian', 49000, 5),
(114, 'Amaya K T', 'Assistant Manager', 52000, 5),
(115, 'Arathi Varma', 'Librarian', 480000,5),
(116, 'Anagha P', 'Librarian', 460000,5);

SELECT * FROM Employee;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(301, 'Arya Raj', 'Thiruvananthapuram', '2021-12-15'),
(302, 'Manoj Nair', 'Thiruvananthapuram', '2022-01-10'),
(303, 'Leena Pillai', 'Thiruvananthapuram', '2023-03-20'),
(304, 'Nitin Das', 'Thiruvananthapuram', '2023-06-10'),
(305, 'Revathi Kumar', 'Kochi', '2021-11-25'),
(306, 'Vishal Ramesh', 'Kochi', '2022-05-05'),
(307, 'Anitha Menon', 'Kochi', '2023-01-15'),
(308, 'Rakesh Mohan', 'Kochi', '2023-06-12'),
(309, 'Meghna Varma', 'Kozhikode', '2020-12-30'),
(310, 'Gopal Raj', 'Kozhikode', '2021-02-14'),
(311, 'Radhika Nair', 'Kozhikode', '2022-09-10'),
(312, 'Ajay Pillai', 'Kozhikode', '2023-06-18'),
(313, 'Deepa Suresh', 'Kollam', '2021-07-20'),
(314, 'Arjun Menon', 'Kollam', '2022-03-11'),
(315, 'Priya Nambiar', 'Kollam', '2023-05-01'),
(316, 'Sanjay Kumar', 'Kollam', '2023-06-25'),
(317, 'Sneha Krishnan', 'Thrissur', '2020-11-15'),
(318, 'Karthik Das', 'Thrissur', '2021-06-05'),
(319, 'Neeraj Pillai', 'Thrissur', '2022-12-10'),
(320, 'Anjali Nair', 'Thrissur', '2023-06-30');

SELECT * FROM Customer;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(401, 303, 'The Catcher in the Rye', '2023-06-10', 1004),
(402, 308, 'Chemmeen', '2023-06-12', 1008),
(403, 312, 'The Gene: An Intimate History', '2023-06-18', 1014),
(404, 316, 'The Kite Runner', '2023-06-25', 1018),
(405, 320, 'The Silk Roads', '2023-06-30', 1024);

SELECT * FROM IssueStatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(506, 303, 'The Catcher in the Rye', '2023-06-15', 1004), 
(507, 308, 'Chemmeen', '2023-06-20', 1008), 
(508, 312, 'The Gene: An Intimate History', '2023-06-25', 1014); 

SELECT * FROM ReturnStatus;

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'Yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name AS Employee_Name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name
FROM IssueStatus I
JOIN Books B ON I.Isbn_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS No_of_Books FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT * FROM Employee;
SELECT Emp_name AS Employee_Name, Position FROM Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT * FROM Customer WHERE Reg_date < '2022-01-01';

SELECT C.Customer_name 
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS No_of_Employees FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT  DISTINCT C.Customer_name 
FROM IssueStatus I 
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

-- 9. Retrieve book_title from book table containing history.
SELECT Book_title FROM Books WHERE Category = 'History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS No_of_Employees FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address 
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

--  12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT C.Customer_name 
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;




