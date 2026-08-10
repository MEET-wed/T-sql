-- Part – A:
-- 1. Create a view Employee_All with all columns.

    CREATE VIEW Employee_All
    AS 
    SELECT * FROM EMPLOYEE

        SELECT * FROM Employee_All

-- 2. Create a view Employee_NameDeptSalary having columns FirstName, Department and Salary.

    CREATE VIEW Employee_NameDeptSalary
    AS
    SELECT FIRSTNAME,DEPARTMENT,SALARY FROM EMPLOYEE

    SELECT * FROM Employee_NameDeptSalary


-- 3. Create a view Employee_Basic having columns EID, FirstName and City.

    CREATE VIEW Employee_Basic
    AS
    SELECT EID,FIRSTNAME,CITY FROM EMPLOYEE

    SELECT * FROM Employee_Basic

-- 4. Create a view IT_Employees that displays IT department data only.

    CREATE VIEW IT_Employees
    AS
    SELECT * FROM EMPLOYEE
    WHERE DEPARTMENT = 'IT'

    SELECT * FROM IT_Employees

-- 5. Create a view HR_Employees that displays HR department data only.

    CREATE VIEW HR_Employees
    AS
    SELECT * FROM EMPLOYEE
    WHERE DEPARTMENT = 'HR'

    SELECT * FROM HR_Employees

-- 6. Create a view Employee_2026 that displays employees joined in 2026 only.

    CREATE VIEW Employee_2026
    AS
    SELECT FIRSTNAME FROM EMPLOYEE
    WHERE JOININGYEAR = 2026

    SELECT * FROM Employee_2026


-- 7. Create a view Patel_Employees that displays employees whose last name is PATEL.

    CREATE VIEW Patel_Employees
    AS
    SELECT * FROM  EMPLOYEE
    WHERE LASTNAME = 'PATEL'

    SELECT * FROM Patel_Employees

-- 8. Create a view High_Salary_Emp having all columns but employees whose salary is more than 12000.

    CREATE VIEW High_Salary_Emp
    AS
    SELECT * FROM EMPLOYEE
    WHERE SALARY > 12000

    SELECT * FROM High_Salary_Emp

-- 9. Create a view that displays information of all employees whose salary is above 14000.

    CREATE VIEW ABC
    AS
    SELECT * FROM EMPLOYEE
    WHERE SALARY > 14000

    SELECT * FROM ABC

-- 10. Create a view that displays employees having salary below 10000.

    CREATE VIEW DEF
    AS
    SELECT * FROM EMPLOYEE
    WHERE SALARY < 10000

    SELECT * FROM DEF


-- 11. Create a view Server_Dept that displays Server department employees only.

    CREATE VIEW Server_Dept
    AS
    SELECT * FROM EMPLOYEE
    WHERE DEPARTMENT = 'SERVER'

    SELECT * FROM Server_Dept

-- 12. Insert a new record into Employee_Basic view. (111, MEET, SURAT)

    INSERT INTO Employee_Basic
    VALUES (111,'MEET','SURAT')

-- 13. Update the department of DEEP from ADMIN to IT in Employee_NameDeptSalary view.

    UPDATE Employee_NameDeptSalary
    SET DEPARTMENT = 'IT'
    WHERE FIRSTNAME = 'DEPP'

-- 14. Delete an employee whose EID is 107 from Employee_Basic view.

    DELETE Employee_Basic
    WHERE EID = 107

-- 15. Drop IT_Employees view from the database.

    DROP VIEW IT_Employees

-- Part – B:
-- 16. Create a view Admin_Employees that displays ADMIN department employees only.

    CREATE VIEW Admin_Employees
    AS
    SELECT * FROM EMPLOYEE
    WHERE DEPARTMENT = 'ADMIN'

    SELECT * FROM Admin_Employees

-- 17. Create a view Female_Employees that displays female employee data only.

    CREATE VIEW Female_Employees
    AS
    SELECT * FROM EMPLOYEE
    WHERE GENDER = 'FEMALE'

    SELECT * FROM Female_Employees

-- 18. Create a view Male_Employees that displays male employee data only.

    CREATE VIEW male_Employees
    AS
    SELECT * FROM EMPLOYEE
    WHERE GENDER = 'MALE'

    SELECT * FROM male_Employees


-- 19. Create a view Rajkot_Employees that displays employees from Rajkot city only.

    CREATE VIEW Rajkot_Employees
    AS
    SELECT * FROM EMPLOYEE
    WHERE CITY = 'RAJKOT'

    SELECT * FROM Rajkot_Employees

-- 20. Create a view Ahmedabad_Employees that displays employees from Ahmedabad city only.

    CREATE VIEW Ahmedabad_Employees
    AS
    SELECT * FROM EMPLOYEE
    WHERE CITY = 'AHMEDABAD'

    SELECT * FROM Ahmedabad_Employees

-- 21. Create a view Salary_Between that displays employees whose salary is between 10000 and 14000.

    CREATE VIEW Salary_Between
    AS
    SELECT * FROM EMPLOYEE
    WHERE SALARY BETWEEN 10000 AND 14000

    SELECT * FROM Salary_Between

-- 22. Create a view Recent_Employees that displays employees joined after 2023.

     CREATE VIEW Recent_Employees
    AS
    SELECT FIRSTNAME FROM EMPLOYEE
    WHERE JOININGYEAR > 2023

    SELECT * FROM Recent_Employees


-- 23. Create a view Old_Employees that displays employees joined before 2023.

     CREATE VIEW Old_Employees
    AS
    SELECT FIRSTNAME FROM EMPLOYEE
    WHERE JOININGYEAR < 2023

    SELECT * FROM OLD_Employees

-- 24. Create a view Employees_Start_R that displays employees whose first name starts with R.

    CREATE VIEW Employees_Start_R
    AS
    SELECT FIRSTNAME FROM EMPLOYEE
    WHERE FIRSTNAME LIKE 'R%'

    SELECT * FROM Employees_Start_R

-- 25. Create a view Employees_End_A that displays employees whose first name ends with A.

     CREATE VIEW Employees_End_A
    AS
    SELECT FIRSTNAME FROM EMPLOYEE
    WHERE FIRSTNAME LIKE '%A'

    SELECT * FROM Employees_End_A

-- Part – C:
-- 26. Create a view Employees_NameContains_H that displays employees whose first name contains H.

    CREATE VIEW Employees_NameContains_H
    AS
    SELECT FIRSTNAME FROM EMPLOYEE
    WHERE FIRSTNAME LIKE '%H%'

    DROP VIEW Employees_NameContains_H

    SELECT * FROM Employees_NameContains_H

-- 27. Create a view for the employees whose first name contains vowels.

    CREATE VIEW vowels
    AS
    SELECT * FROM EMPLOYEE
    WHERE FIRSTNAME LIKE '%[AEIOU]%'

    SELECT * FROM vowels

-- 28. Create a view FourLetter_Name having EID, FirstName and Department columns in which FirstName
-- consists of four letters.

    CREATE VIEW FourLetter_Name
    AS
    SELECT EID,FIRSTNAME,LASTNAME FROM EMPLOYEE
    WHERE FIRSTNAME LIKE '____'

    SELECT * FROM FourLetter_Name

-- 29. Create a view for the employees whose name starts with M and ends with N.

    CREATE VIEW MN
    AS
    SELECT * FROM EMPLOYEE
    WHERE FIRSTNAME LIKE 'M%%N'

    SELECT * FROM MN

-- 30. Create a view Transport_Dept that displays Transport department employees only. 

    CREATE VIEW Transport_Dept
    AS
    SELECT * FROM EMPLOYEE
    WHERE DEPARTMENT = 'TRANSPORT'

    SELECT * FROM Transport_Dept



-----------------------------------------------------------------------------------------------------------

CREATE TABLE Customers (
 CustomerID INT PRIMARY KEY,
 CustomerName VARCHAR (100) NOT NULL,
 City VARCHAR (100),
 Membership VARCHAR (20)
);


INSERT INTO Customers (CustomerID, CustomerName, City, Membership) VALUES
(101, 'Alice', 'Mumbai', 'Gold'),
(102, 'Bob', 'Delhi', 'Silver'),
(103, 'Charlie', 'Pune', 'Gold'),
(104, 'David', 'Ahmedabad', 'Silver'),
(105, 'Eva', 'Mumbai', 'Platinum');


CREATE TABLE Orders (
 OrderID INT PRIMARY KEY,
 CustomerID INT NOT NULL,
 Product VARCHAR (100) NOT NULL,
 Category VARCHAR (50),
 Quantity INT NOT NULL,
 Price DECIMAL (10,2) NOT NULL,
 FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);


INSERT INTO Orders (OrderID, CustomerID, Product, Category, Quantity, Price)
VALUES
(201, 101, 'Laptop', 'Electronics', 1, 70000),
(202, 101, 'Mouse', 'Electronics', 2, 800),
(203, 102, 'Chair', 'Furniture', 3, 2500),
(204, 103, 'Phone', 'Electronics', 1, 45000),
(205, 104, 'Table', 'Furniture', 2, 6000),
(206, 105, 'Laptop', 'Electronics', 2, 70000),
(207, 105, 'Printer', 'Electronics', 1, 12000),
(208, 103, 'Desk', 'Furniture', 1, 8000);




-- 1) Create a view named CustomerOrders displaying:
-- • Customer Name
-- • City
-- • Product
-- • Category
-- • Quantity
-- • Price

    CREATE VIEW CustomerOrders
    AS
    SELECT CustomerName,City,Product,Category,Quantity,Price FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID

    SELECT * FROM CustomerOrders

-- 2) Create a view named GoldCustomersOrders that displays all orders placed by gold
-- members.

    CREATE VIEW GoldCustomersOrders
    AS
      SELECT CustomerName,City,Product,Category,Quantity,Price FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID
    WHERE Membership = 'GOLD'

    SELECT * FROM GoldCustomersOrders

-- 3) Create a view ElectronicOrders displaying only Electronics orders.

    CREATE VIEW ElectronicOrders
    AS
      SELECT CustomerName,City,Product,Category,Quantity,Price FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID
    WHERE Product = 'Electronics'

    SELECT * FROM ElectronicOrders

-- 4) Create a view CustomerPurchaseSummary showing the total purchase amount for
-- each customer.
-- (Purchase Amount = Quantity * Price)

    CREATE VIEW CustomerPurchaseSummary
    AS
      SELECT CustomerName,SUM(Quantity*Price) AS Total FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID
    GROUP BY CustomerName 

    SELECT * FROM CustomerPurchaseSummary

-- 5) Create a view CustomerOrderCount showing:
-- • Customer Name
-- • Number of Orders placed

    CREATE VIEW Customer_OrderCount
    AS
      SELECT C.CustomerName,COUNT(O.OrderID) AS Total FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID
    GROUP BY CustomerName

SELECT * FROM Customer_OrderCount
   

-- 6) Create a view CategorySales displaying:
-- • Category
-- • Number of Orders
-- • Total quantity sold


    CREATE VIEW CategorySales
    AS
      SELECT Category,COUNT(OrderID),SUM(Quantity) FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID
    GROUP BY Category

-- 7) Create a view AmountDetails displaying:
-- • Membership Type
-- • Average purchase amount per order


    CREATE VIEW AmountDetails
    AS
    SELECT Membership,AVG(Quantity*Price) AS AV FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID
    GROUP BY Membership

    SELECT * FROM AmountDetails

-- 8) Create a view CitySales displaying:
-- • City
-- • Total Customers who placed orders
-- • Total purchase amount

    CREATE VIEW CitySales
    AS
     SELECT City,COUNT(CustomerName) AS NAME ,SUM(Quantity*Price) FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID
    GROUP BY City

    SELECT * FROM CitySales


-- 9) Create a view CustomerSales displaying:
-- • Customer Name
-- • Membership
-- • Total quantity purchased
-- • Total amount spent

    CREATE VIEW CustomerSales
    AS
     SELECT CustomerName,Membership,COUNT(Quantity) AS COU,SUM(Quantity*Price) AS total AS AV FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID
    GROUP BY CustomerName,Membership

    SELECT * FROM CustomerSales

--  10) Create a view CustomerMembership displaying:
-- • Category
-- • Membership Type
-- • Total sales
-- • Average quantity purchased

    CREATE VIEW CustomerMembership
    AS
     SELECT Category,Membership,AVG(Quantity) AS AV ,SUM(Quantity) AS SUM FROM Customers C
    JOIN Orders O
    ON C.CustomerID = O.CustomerID
    GROUP BY Category,Membership

    SELECT * FROM CustomerMembership