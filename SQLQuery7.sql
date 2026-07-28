--Part – A: 

--1. Display the Highest, Lowest Salary and Label the columns Maximum, Minimum respectively.

SELECT * FROM EMPLOYEE
SELECT MAX(SALARY) AS Maximum FROM EMPLOYEE
SELECT MIN(SALARY) AS Minimum FROM EMPLOYEE



--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, 
--respectively. 

SELECT SUM(SALARY) AS Total_Sal FROM EMPLOYEE
SELECT AVG(SALARY) AS Average_Sal FROM EMPLOYEE

--3. Find total number of employees of EMPLOYEE table. 

SELECT COUNT(EID) AS TOTAL_EMP FROM EMPLOYEE

--4. Find highest salary from Rajkot city. 

SELECT CITY,MAX(SALARY) AS HIGH_SAL_RAJKOT FROM EMPLOYEE
WHERE CITY = 'RAJKOT'


--5. Give maximum salary from IT department.

SELECT MAX(SALARY) AS HIGH_SAL_IT FROM EMPLOYEE
WHERE DEPARTMENT = 'IT'

--6. Count employee department is HR. 

SELECT COUNT(EID) AS TOTAL_EMP_HR FROM EMPLOYEE
WHERE DEPARTMENT = 'HR'

SELECT * FROM EMPLOYEE

--7. Display average salary of Admin department.

SELECT AVG(SALARY) AS AVG_SAL_ADMIN FROM EMPLOYEE
WHERE DEPARTMENT = 'ADMIN'

--8. Display total salary of HR department. 

SELECT SUM(SALARY) AS TOTAL_HR_SAL FROM EMPLOYEE
WHERE DEPARTMENT = 'HR'

--9. Count total number of cities of employee without duplication. 

SELECT CITY , COUNT(EID) FROM EMPLOYEE
GROUP BY CITY

--10. Count unique departments. 

SELECT DEPARTMENT , COUNT(EID) FROM EMPLOYEE
GROUP BY DEPARTMENT

--11. Display minimum salary of employee who belongs to Ahmedabad.

SELECT MIN(SALARY) AS MIN_AMD FROM EMPLOYEE
WHERE CITY = 'AHMEDABAD'

--12. Find city wise highest salary. 

SELECT CITY , MAX(SALARY) FROM EMPLOYEE
GROUP BY CITY

--13. Find department wise lowest salary.

SELECT DEPARTMENT , MIN(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT

--14. Display minimum salary in each city.

SELECT CITY , MIN(SALARY) FROM EMPLOYEE
GROUP BY CITY

--15. Display average salary of employees from Surat.

SELECT AVG(SALARY) AS AVG_SURAT FROM EMPLOYEE
WHERE CITY = 'SURAT'

--16. Display total salary of female employees.

SELECT SUM(SALARY) AS TOTAL_SAL_FEMALE FROM EMPLOYEE
WHERE GENDER = 'FEMALE'

--17. Count number of male employees. 

SELECT COUNT(EID) AS NUM_OF_EMP FROM EMPLOYEE
WHERE GENDER = 'MALE'

--18. Display city with the total number of employees belonging to each city. 

SELECT CITY , COUNT(EID) AS EMP_CIRT_WISE FROM EMPLOYEE
GROUP BY CITY

--19. Count number of employees in each city where gender is MALE.

SELECT CITY , COUNT(EID) AS EMP_CIRT_WISE FROM EMPLOYEE
WHERE GENDER = 'MALE'
GROUP BY CITY


--20. Display maximum salary in each department where city is not Ahmedabad.

SELECT DEPARTMENT , MAX(SALARY)  FROM EMPLOYEE
WHERE  CITY != 'AHMEDABAD'
GROUP BY DEPARTMENT

--Part – B: 

--21. Display minimum salary in each city where gender is FEMALE.

SELECT CITY , MIN(SALARY) FROM EMPLOYEE
WHERE GENDER = 'FEMALE'
GROUP BY CITY

--22. Give total salary of each department of EMPLOYEE table.

SELECT DEPARTMENT , SUM(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT

--23. Give average salary of each department of EMPLOYEE table without displaying the respective 
--department name.

SELECT  AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT


--24. Count the number of employees for each department in every city. 

SELECT CITY , DEPARTMENT, COUNT(EID) FROM EMPLOYEE
GROUP BY CITY, DEPARTMENT


--25. Calculate the total salary distributed to male and female employees.

SELECT GENDER, SUM(SALARY) FROM EMPLOYEE
GROUP BY GENDER

--Part – C: 

--26. Give city wise maximum and minimum salary of female employees.

SELECT CITY , MAX (SALARY) , MIN(SALARY) FROM EMPLOYEE
WHERE GENDER = 'FEMALE'
GROUP BY CITY

--27. Calculate department, city, and gender wise average salary. 

SELECT DEPARTMENT, AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT
SELECT CITY, AVG(SALARY) FROM EMPLOYEE
GROUP BY CITY
SELECT GENDER, AVG(SALARY) FROM EMPLOYEE
GROUP BY GENDER

--28. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 

SELECT MAX(SALARY)-MIN(SALARY) AS DIFFERENCE FROM EMPLOYEE


--29. Display sum of salaries of department wise where department name consist 5 letter. 

SELECT DEPARTMENT , SUM(SALARY) FROM EMPLOYEE
WHERE DEPARTMENT LIKE '_____'
GROUP BY DEPARTMENT

--30. Find the Maximum salary department & city wise in which city name starts with ‘R’.

SELECT DEPARTMENT,CITY , MAX(SALARY) FROM EMPLOYEE
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT,CITY


--EXTRA QUESTIONS: 

--1. Display the total fine amount collected for each book genre. 

SELECT BookGenre, SUM(FineAmount) from LibraryBorrowing
group by BookGenre


--2. Find the average number of days borrowed for each book 
--genre.

SELECT BookGenre, avg(DaysBorrowed) from LibraryBorrowing
group by BookGenre

--3. Display the number of borrowing records for each member. 

SELECT MemberName,COUNT(BorrowID) FROM LibraryBorrowing
GROUP BY  MemberName

--4. Find the maximum fine amount paid in each book genre.

SELECT BookGenre , MAX(FineAmount) FROM LibraryBorrowing
GROUP BY BookGenre

--5. Display the minimum days borrowed for each book genre. 

SELECT BookGenre , MAX(FineAmount) FROM LibraryBorrowing
GROUP BY BookGenre

--6. Find the total number of days books were borrowed by each 
--member

SELECT MemberName , SUM(DaysBorrowed) FROM LibraryBorrowing
GROUP BY MemberName

--7. Display the average fine amount paid by each member.

SELECT MemberName , AVG(FineAmount) FROM LibraryBorrowing
GROUP BY MemberName

--8. Find the highest number of days borrowed by each member.

SELECT MemberName , MAX(DaysBorrowed) FROM LibraryBorrowing
GROUP BY MemberName

--9. Find the difference between the highest and lowest fine for each genre.

SELECT BookGenre , MAX(FineAmount) - MIN(FineAmount) FROM LibraryBorrowing
GROUP BY BookGenre

--10. Find how many times has each member borrowed a book.

SELECT MemberName , COUNT(BorrowID) FROM LibraryBorrowing
GROUP BY MemberName








