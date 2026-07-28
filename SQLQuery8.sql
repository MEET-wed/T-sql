--Part – A: 

--1. Display cities where total salary of employees greater than 20000.

SELECT CITY, SUM(SALARY) FROM EMPLOYEE
GROUP BY CITY
HAVING  SUM(SALARY)>20000

--2. Display departments having average salary greater than 12000. 

SELECT DEPARTMENT, AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING AVG(SALARY)>12000

--3. Display departments having total salary greater than 20000.

SELECT DEPARTMENT, SUM(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING SUM(SALARY)>20000

--4. Display departments having number of employees greater than 2.

SELECT DEPARTMENT, COUNT(EID) FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING COUNT(EID)>2

--5. Display cities where minimum salary less than 7000.

SELECT CITY, MIN(SALARY) FROM EMPLOYEE
GROUP BY CITY
HAVING MIN(SALARY)<7000


--6. Display cities where average salary less than 12000. 

SELECT CITY, AVG(SALARY) FROM EMPLOYEE
GROUP BY CITY
HAVING AVG(SALARY)<12000

--7. Display departments where maximum salary greater than 14000.

SELECT DEPARTMENT, MAX(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING MAX(SALARY)>14000

--8. Display cities where total salary greater than equal to 30000.

SELECT CITY, SUM(SALARY) FROM EMPLOYEE
GROUP BY CITY
HAVING SUM(SALARY)>=30000

--9. Display departments having number of employees equal to 2. 

SELECT DEPARTMENT , COUNT(EID) FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING COUNT(EID)=2


--10. Display cities having number of female employees greater than equal to 1.

SELECT CITY, COUNT(EID) FROM EMPLOYEE
WHERE GENDER = 'FEMALE'
GROUP BY CITY
HAVING  COUNT(EID)>=1

--11. Display departments where minimum salary of male employees greater than 7000. 

SELECT DEPARTMENT, MIN(SALARY) FROM EMPLOYEE
WHERE GENDER = 'MALE'
GROUP BY DEPARTMENT
HAVING MIN(SALARY) > 7000

--12. Display cities where maximum salary of female employees less than 13000.

SELECT CITY, MAX(SALARY) FROM EMPLOYEE
WHERE GENDER = 'FEMALE'
GROUP BY CITY
HAVING  MAX(SALARY) < 13000

--13. Display departments where average salary greater than 10000 and less than 14000.

SELECT DEPARTMENT, AVG(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 10000 AND AVG(SALARY) <14000

--14. Display cities where number of employees joined before 2023 greater than 1. 

SELECT CITY, COUNT(EID) FROM EMPLOYEE
WHERE JOININGYEAR < 2023
GROUP BY CITY
HAVING  COUNT(EID) > 1

--15. Display cities where total salary of male employees greater than 15000, ordered by total salary. 


SELECT CITY, SUM(SALARY) AS TOTAL_SAL FROM EMPLOYEE
WHERE GENDER = 'MALE'
GROUP BY CITY
HAVING  SUM(SALARY) > 15000
ORDER BY TOTAL_SAL

--16. Display departments where maximum salary greater than 13000, ordered by max salary. 

SELECT DEPARTMENT, MAX(SALARY) AS MAX_SALARY FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING MAX(SALARY) > 13000
ORDER BY MAX_SALARY

--17. Display cities where total salary of male employees greater than 15000.

SELECT CITY, SUM(SALARY) FROM EMPLOYEE
WHERE GENDER = 'MALE'
GROUP BY CITY
HAVING SUM(SALARY) > 15000

--18. Display departments where employees joined after 2022 and count greater than 1.  

SELECT DEPARTMENT , COUNT(EID) FROM EMPLOYEE
WHERE JOININGYEAR > 2022
GROUP BY DEPARTMENT
HAVING COUNT(EID) > 1

--19. Display departments where average salary of female employees greater than 8000.

SELECT DEPARTMENT , AVG(SALARY) FROM EMPLOYEE
WHERE GENDER = 'FEMALE'
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 8000

--20. Display departments having total salary greater than 20000 and less than 40000.  

SELECT DEPARTMENT , SUM(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING SUM(SALARY) > 20000 AND SUM(SALARY) < 40000

--------------------------------------------------------------------------------------------------------------

--1) Display each department and the total hours worked. 

SELECT DISTINCT Department ,sum(Hours_Worked) from Project_Assignments
group by Department

--2) Show departments where the total hours worked are greater than 
--120. 

SELECT DISTINCT Department ,sum(Hours_Worked) from Project_Assignments
group by Department
having sum(Hours_Worked) > 120

--3) Find the average hours worked in each department and display 
--them from highest to lowest average.

SELECT DISTINCT Department ,avg(Hours_Worked) from Project_Assignments
group by Department
order by avg(Hours_Worked) asc

--4) Display departments having more than 3 employees. 

SELECT DISTINCT Department ,count(Assignment_ID) from Project_Assignments
group by Department
having count(Assignment_ID) > 3

--5) Show departments whose maximum hours worked exceed 45. 

SELECT DISTINCT Department ,max(Hours_Worked) from Project_Assignments
group by Department
having max(Hours_Worked) < 45

--6) Find departments where the minimum hours worked is less than 30 
--and sort by minimum hours.

SELECT DISTINCT Department ,min(Hours_Worked) from Project_Assignments
group by Department
having min(Hours_Worked) < 30

--7) Display each department with employee count and total hours. 
--Show only departments having an average greater than 40.

SELECT DISTINCT Department ,count(Assignment_ID),sum(Hours_Worked) from Project_Assignments
group by Department
having avg(Hours_Worked) <40

--8) Find departments where total hours are between 100 and 170. 
--Display them in descending order of total hours.

SELECT  Department ,sum(Hours_Worked) from Project_Assignments
group by Department
having sum(Hours_Worked) between 100 and 170
order by sum(Hours_Worked) desc

--9) Display departments having at least 3 employees. Sort first by 
--employee count (descending), then by department name 
--(ascending). 

select Department , count(Assignment_ID) from Project_Assignments
group by Department
having count(Assignment_ID) < 3 
order by count(Assignment_ID) desc


--10) Display each department with: 
--• Number of employees  
--• Total hours worked  
--• Average hours worked  
--Show only departments where: 
--• Total hours are greater than 110  
--• Average hours are greater than 38  
--Sort by average hours (descending) and then department name.


select distinct Department ,count(Assignment_ID),sum(Hours_Worked) from Project_Assignments
group by Department


