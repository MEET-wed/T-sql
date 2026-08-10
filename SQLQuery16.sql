--From the table EMPLOYEE perform the following queries:  
--Part – A: 
--1.  Create a view Employee_All with all columns. 
CREATE VIEW EMPLOYEE_ALL AS
SELECT * FROM EMPLOYEE
--2.  Create a view Employee_NameDeptSalary having columns FirstName, Department and Salary.
CREATE VIEW  Employee_NameDeptSalary AS
SELECT  FirstName, Department , Salary
FROM EMPLOYEE

--3.  Create a view Employee_Basic having columns EID, FirstName and City. 
CREATE VIEW Employee_Basic AS
SELECT  EID, FirstName ,City
FROM EMPLOYEE
--4.  Create a view IT_Employees that displays IT department data only. 
CREATE VIEW IT_Employees AS

SELECT * FROM EMPLOYEE
WHERE DEPARTMENT='IT'
--5.  Create a view HR_Employees that displays HR department data only. 
CREATE VIEW HR_Employees AS
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT='HR'

--6.  Create a view Employee_2026 that displays employees joined in 2026 only.
CREATE VIEW Employee_2026
AS
SELECT * FROM EMPLOYEE
WHERE JOININGYEAR=2026
--7.  Create a view Patel_Employees that displays employees whose last name is PATEL. 
Create  view Patel_Employees AS
SELECT * FROM EMPLOYEE
WHERE LASTNAME='PATEL'
--8.  Create a view High_Salary_Emp having all columns but employees whose salary is more than 12000. 
Create  view High_Salary_Emp AS
SELECT * FROM EMPLOYEE
WHERE SALARY >12000
--9.  Create a view that displays information of all employees whose salary is above 14000. 
CREATE VIEW Salary_Above_14000 AS
SELECT * FROM EMPLOYEE WHERE Salary > 14000;


--10. Create a view that displays employees having salary below 10000. 
Create  view SALARY_BELOW_10000 AS
SELECT * FROM EMPLOYEE
WHERE Salary < 10000;

--11. Create a view Server_Dept that displays Server department employees only. 
CREATE VIEW Server_Dept AS
SELECT * FROM EMPLOYEE
WHERE Department = 'Server';




-- 12. Insert a new record into Employee_Basic view  (111, MEET, SURAT) 
INSERT INTO Employee_Basic (EID, FirstName, City)
VALUES (111, 'MEET', 'SURAT');

-- 13. Update the department of DEEP from ADMIN to IT
UPDATE Employee_NameDeptSalary
SET Department = 'IT'
WHERE FirstName = 'DEEP' AND Department = 'ADMIN';

-- 14. Delete an employee whose EID is 107
DELETE FROM Employee_Basic
WHERE EID = 107;

 
--Part – B: 
--16. Create a view Admin_Employees that displays ADMIN department employees only.
CREATE VIEW Admin_Employees AS
SELECT * FROM Employee
WHERE Department = 'ADMIN';


--17. Create a view Female_Employees that displays female employee data only. 
CREATE VIEW Female_Employees AS
SELECT * FROM Employee
WHERE Gender = 'Female';
--18. Create a view Male_Employees that displays male employee data only.
CREATE VIEW Male_Employees AS
SELECT * FROM Employee
WHERE Gender = 'Male';
--19. Create a view Rajkot_Employees that displays employees from Rajkot city only. 
CREATE VIEW Rajkot_Employees AS
SELECT * FROM Employee
WHERE City = 'Rajkot';

--20. Create a view Ahmedabad_Employees that displays employees from Ahmedabad city only. 
CREATE VIEW Ahmedabad_Employees AS
SELECT * FROM Employee
WHERE City = 'Ahmedabad';
--21. Create a view Salary_Between that displays employees whose salary is between 10000 and 14000. 
CREATE VIEW Salary_Between AS
SELECT * FROM Employee
WHERE Salary BETWEEN 10000 AND 14000;

--22. Create a view Recent_Employees that displays employees joined after 2023. 
CREATE view Recent_Employees AS
SELECT * FROM EMPLOYEE
WHERE JOININGYEAR < 2023
--23. Create a view Old_Employees that displays employees joined before 2023. 
CREATE VIEW Old_Employees AS
SELECT * FROM Employee
WHERE JOININGYEAR > 2023;
--24. Create a view Employees_Start_R that displays employees whose first name starts with R.
CREATE VIEW Employees_Start_R AS
SELECT * FROM Employee
WHERE FirstName LIKE 'R%';

--25. Create a view Employees_End_A that displays employees whose first name ends with A. 
 CREATE VIEW Employees_End_A AS
SELECT * FROM Employee
WHERE FirstName LIKE '%A';

--Part – C: 
--26. Create a view Employees_NameContains_H that displays employees whose first name contains H.
CREATE VIEW Employees_NameContains_H AS
SELECT * FROM Employee
WHERE FirstName LIKE '%H%';

--27. Create a view for the employees whose first name contains vowels. 
CREATE VIEW Employees_NameContains_Vowels AS
SELECT * FROM Employee
WHERE FirstName LIKE '%A%'
   OR FirstName LIKE '%E%'
   OR FirstName LIKE '%I%'
   OR FirstName LIKE '%O%'
   OR FirstName LIKE '%U%';
--28. Create a view FourLetter_Name having EID, FirstName and Department columns in which FirstName 
--consists of four letters. 
CREATE VIEW FourLetter_Name AS
SELECT EID, FirstName, Department
FROM Employee
WHERE LEN(FirstName) = 4;

--29. Create a view for the employees whose name starts with M and ends with N.
CREATE VIEW Employees_MN AS
SELECT * FROM Employee
WHERE FirstName LIKE 'M%N';


--30. Create a view Transport_Dept that displays Transport department employees only.

CREATE VIEW Transport_Dept AS
SELECT * FROM Employee
WHERE Department = 'Transport';

