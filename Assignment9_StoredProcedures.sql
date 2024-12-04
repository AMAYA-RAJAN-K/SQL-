# creating database 
CREATE DATABASE WorkesDB;
USE WorkesDB;
drop database WorkesDB;
#Creating table 
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);

#Inserting values
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(1, 'Alice', 'Smith', 50000, '2022-01-15', 'HR'),
(2, 'Bob', 'Johnson', 60000, '2021-03-10', 'IT'),
(3, 'Charlie', 'Brown', 70000, '2020-07-20', 'Finance'),
(4, 'Diana', 'Davis', 80000, '2019-11-05', 'IT'),
(5, 'Evan', 'Taylor', 55000, '2022-06-12', 'HR'),
(6, 'Siona', 'Watson', 75000, '2020-09-18', 'Sales'),
(7, 'George', 'Martin', 67000, '2021-04-22', 'Marketing'),
(8, 'Helen', 'Clark', 72000, '2018-12-30', 'Finance'),
(9, 'Ivan', 'Thomas', 48000, '2022-08-01', 'HR'),
(10, 'Jack', 'White', 62000, '2021-01-25', 'IT');

SELECT * FROM Worker;

-- 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record 
-- to the table and then invokes the procedure call. 

DELIMITER //
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END;
//

DELIMITER ;

CALL AddWorker(11, 'Prince', 'John', 52000, '2022-10-12', 'HR');
SELECT * FROM Worker;

-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY.
-- It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.

DELIMITER //
CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END;
//

DELIMITER ;

CALL GetWorkerSalary(1, @Salary);
SELECT @Salary AS WorkerSalary;

-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT.
-- It should update the department of the worker with the given ID. Then make a procedure call.

DELIMITER //
CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END;
//

DELIMITER ;

CALL UpdateWorkerDepartment(1, 'Finance');
SELECT * FROM Worker;

-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount.
-- It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call.

DELIMITER //
CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount 
    FROM Worker
    WHERE Department = p_Department;
END;
//

DELIMITER ;

SELECT * FROM Worker;
CALL GetWorkerCount('HR', @WorkerCount);
SELECT @WorkerCount AS GetWorkerCount;

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
-- It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

DELIMITER //
CREATE PROCEDURE GetAvgSalary(
    IN p_Department CHAR(25),
    OUT p_avgSalary INT
)
BEGIN
	SELECT avg(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END;
//

DELIMITER ;

SELECT * FROM Worker;
CALL GetAvgSalary('IT',@AvgSalary);
SELECT @AvgSalary AS GetAvgSalary;


