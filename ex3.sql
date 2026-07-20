 
CREATE DATABASE CyberDB;

USE CyberDB;


CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DateOfBirth DATE
);

 
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    CourseTitle VARCHAR(100),
    Trainer VARCHAR(50),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

 
INSERT INTO Users VALUES
(101, 'Alice', 'Walker', 'alice.walker@example.com', '2003-06-01'),
(102, 'Jack', 'Smith', 'jack.smith@example.com', '2004-07-15'),
(103, 'Jenny', 'Brown', 'jenny.brown@example.com', '2005-08-20'),
(104, 'David', 'Lee', 'david.lee@example.com', '2002-09-25'),
(105, 'Julia', 'White', 'julia.white@example.com', '2001-10-30');

 
INSERT INTO Enrollments (CourseTitle, Trainer, UserID) VALUES
('Cyber Security Basics', 'Dr. Kevin Mitnick', 101),
('Advanced Hacking', 'Dr. Ada Lovelace', 102),
('Digital Forensics', 'Dr. Grace Hopper', 103),
('Cryptography', 'Dr. Alan Turing', 104),
('AI in Security', 'Dr. Elon Musk', 102),
('Ethical Hacking', 'Dr. Linus Torvalds', 105);
 
SELECT COUNT(*) AS UsersAfter2004
FROM Users
WHERE DateOfBirth > '2004-01-01';

 
SELECT AVG(EnrollmentID) AS AvgEnrollmentID
FROM Enrollments
WHERE Trainer = 'Dr. Alan Turing';

 
SELECT SUM(EnrollmentID) AS TotalEnrollment
FROM Enrollments
WHERE Trainer = 'Dr. Grace Hopper';

 
SELECT UserID, COUNT(*) AS CourseCount
FROM Enrollments
GROUP BY UserID;
 
SELECT MIN(DateOfBirth) AS EarliestDOB
FROM Users
WHERE LastName = 'Smith';
 
SELECT COUNT(*) AS TotalCourses
FROM Enrollments
WHERE UserID IN (
    SELECT UserID
    FROM Users
    WHERE DateOfBirth < '2005-01-01'
);
 
SELECT AVG(UserID) AS AvgUserID
FROM Enrollments
WHERE CourseTitle = 'Cyber Security Basics';
 
SELECT Trainer, COUNT(*) AS CoursesTaught
FROM Enrollments
WHERE UserID IN (
    SELECT UserID
    FROM Users
    WHERE DateOfBirth > '2003-01-01'
)
GROUP BY Trainer;

 
SELECT MAX(UserID) AS MaxUserID
FROM Enrollments
WHERE Trainer = 'Dr. Kevin Mitnick';
 
SELECT SUM(EnrollmentID) AS TotalFromJ
FROM Enrollments
WHERE UserID IN (
    SELECT UserID
    FROM Users
    WHERE FirstName LIKE 'J%'
);
 
SELECT
    CONCAT(UPPER(FirstName), ' ', UPPER(LastName)) AS FullNameUpper,
    DATEDIFF(NOW(), DateOfBirth) DIV 365 AS Age
FROM Users;
 

