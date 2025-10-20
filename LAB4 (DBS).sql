CREATE DATABASE mydb;
USE mydb;
CREATE TABLE Employees (
  EmpID INT NOT NULL PRIMARY KEY,
  EmpName VARCHAR(20) NOT NULL UNIQUE,
  Nationality VARCHAR(20),
  Qualification VARCHAR(20),
  Salary DECIMAL(7,2) NOT NULL,
  AppointmentDate DATE,
  ExpertYears TINYINT,
  Occupation VARCHAR(20)
);
INSERT INTO Employees (EmpID, EmpName, Nationality, Qualification, Salary, AppointmentDate, ExpertYears, Occupation)
VALUES
(1, 'Ahmed Saleh', 'Saudi', 'BA', 5000.00, '2001-01-01', 2, 'TA'),
(2, 'Khalid Al Ahmadi', 'Saudi', 'Master', 7500.00, '2002-02-02', 4, NULL),
(3, 'Fahad Abdullah', 'Syrian', 'Master', 7000.00, '2003-03-03', 2, 'Lecturer'),
(4, 'Adel Ahmad', 'Egyptian', 'Doctorate', 9000.00, '2004-04-04', NULL, 'Doctor'),
(5, 'Rami Omar', 'Saudi', 'Doctorate', 11500.00, '2005-05-05', 8, 'Doctor'),
(6, 'Samer Mohmad', 'Syrian', 'Doctorate', 9500.00, '2006-06-06', 3, 'Doctor');

-- view all rows 
SELECT * FROM Employees; 

-- 2. Retrieve employee names and occupations
SELECT EmpName, Occupation FROM Employees;

-- 3. Employees with qualification = 'Master'
SELECT EmpName, Occupation FROM Employees 
WHERE Qualification = 'Master';

-- 4. Employees with qualification = 'Master' and ExpertYears > 3
SELECT EmpName, Occupation FROM Employees
WHERE Qualification = 'Master' AND ExpertYears > 3;

-- 5. Employees whose nationality = 'Saudi' OR salary > 7000
SELECT EmpName, Nationality, Salary FROM Employees 
WHERE Nationality = 'Saudi' OR Salary > 7000;

-- 6. Employees whose nationality = 'Saudi' AND salary > 7000 AND ExpertYears < 5
SELECT EmpName, Nationality, Salary, ExpertYears FROM Employees
WHERE Nationality = 'Saudi' AND Salary > 7000 AND ExpertYears < 5;

-- 7. Employees who don’t have an occupation (IS NULL)
SELECT EmpName FROM Employees WHERE Occupation IS NULL;

-- 8. Rename (alias) columns
SELECT EmpName AS Name, Salary AS MonthlySalary FROM Employees;

-- 9. Count total employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- 10. Employees whose names start with 'A'
SELECT EmpName FROM Employees WHERE EmpName LIKE 'A%';

-- 11. Employees whose names end with 'h'
SELECT EmpName FROM Employees WHERE EmpName LIKE '%h';

-- 12. Employees whose names contain 'm'
SELECT EmpName FROM Employees WHERE EmpName LIKE '%m%';

-- 13. Use parentheses for mixed AND/OR
SELECT EmpName , Nationality, Salary, ExpertYears FROM Employees
WHERE (Nationality = 'Saudi' AND Salary > 7000) OR ExpertYears > 5;

-- 14. Employees whose nationality is NOT 'Saudi' <> 
SELECT EmpName, Nationality
FROM Employees
WHERE Nationality <> 'Saudi';

-- 15. Employees whose nationality IN ('Saudi', 'Syrian')
SELECT EmpName, Nationality FROM Employees
WHERE Nationality IN ('Saudi', 'Syrian');

-- 16. Count employees by nationality
SELECT Nationality, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY Nationality;

-- 17. Average salary by qualification
SELECT Qualification, ROUND(AVG(Salary),2) AS AvgSalary
FROM Employees
GROUP BY Qualification;

-- 18. Maximum and minimum salary
SELECT MAX(Salary) AS Highest, MIN(Salary) AS Lowest
FROM Employees;

-- 19. Sum of all salaries
SELECT SUM(Salary) AS TotalSalaries FROM Employees;

-- 20. Show employees ordered by salary (descending)
SELECT EmpName, Salary
FROM Employees
ORDER BY Salary DESC;