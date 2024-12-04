CREATE DATABASE TeachersDB;
USE TeachersDB;

-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.

CREATE TABLE Teachers (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Subject VARCHAR(50),
    Experience INT,
    Salary DECIMAL(10,2)
);
    
INSERT INTO Teachers (Id, Name, Subject, Experience, Salary)
VALUES
(1, 'Alice Smith', 'Mathematics', 12, 55000.00),
(2, 'Bob Johnson', 'Physics', 8, 48000.00),
(3, 'Charlie Brown', 'Chemistry', 10, 50000.00),
(4, 'Diana Davis', 'Biology', 5, 42000.00),
(5, 'Evan Taylor', 'History', 15, 60000.00),
(6, 'George Martin', 'English', 7, 45000.00),
(7, 'Helen Clark', 'Computer Science', 3, 40000.00),
(8, 'Ivan Thomas', 'Geography', 9, 47000.00);

SELECT * FROM Teachers;

-- 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative”
-- if the salary inserted to the table is less than zero.

DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;
//
DELIMITER ;

# Testing the trigger
INSERT INTO teachers (id, name, subject, experience, salary) 
VALUES (9, 'John Doe', 'Art', 6, -10000.00);

-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. 
-- tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.

CREATE TABLE Teacher_log (
    Teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DESC Teacher_log;

DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END;
//
DELIMITER ;

# Testing the trigger
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (9, 'John Doe', 'Art', 6, 37000.00);
SELECT * FROM teacher_log;


-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.

DELIMITER //
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teachers with experience greater than 10 years';
    END IF;
END;
//
DELIMITER ;

# Testing the trigger
DELETE FROM teachers WHERE id = 5;

-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log(teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END;
//
DELIMITER ;

# Testing the trigger
DELETE FROM teachers WHERE id = 2;
SELECT * FROM teacher_log;

SELECT * FROM Teachers;



