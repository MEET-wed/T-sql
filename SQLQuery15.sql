-- Part – A: 
-- 1.  List all books with their authors.

    SELECT TITLE,AUTHORNAME FROM BOOK B
    JOIN AUTHOR A
    ON B.PUBLISHERID = A.PUBLISHERID

-- 2.  List all books with their publishers. 

    SELECT TITLE,PUBLISHERNAME FROM BOOK B
    JOIN PUBLISHER P
    ON B.PUBLISHERID = P.PUBLISHERID

-- 3.  List all books with their authors and publishers. 

    SELECT TITLE,AUTHORNAME,P.PUBLISHERNAME FROM BOOK B
    JOIN AUTHOR A
    ON A.PUBLISHERID = B.PUBLISHERID
    JOIN PUBLISHER P
    ON B.PUBLISHERID=P.PUBLISHERID

-- 4.  List all books published after 2010 with their authors and publisher and price.

     SELECT TITLE,AUTHORNAME,P.PUBLISHERNAME FROM BOOK B
    JOIN AUTHOR A
    ON A.PUBLISHERID = B.PUBLISHERID
    JOIN PUBLISHER P
    ON B.PUBLISHERID=P.PUBLISHERID
    WHERE PUBLICATIONYEAR > 2010


-- 5.  List all authors and the number of books they have written. 

    SELECT AUTHORNAME,COUNT(TITLE) FROM BOOK B
    JOIN AUTHOR A
    ON B.PUBLISHERID = A.PUBLISHERID
    GROUP BY AUTHORNAME

-- 6.  List all publishers and the total price of books they have published.

    SELECT PUBLISHERNAME , SUM(PRICE) FROM BOOK B
    JOIN PUBLISHER P
    ON B.PUBLISHERID = P.PUBLISHERID
    GROUP BY PUBLISHERNAME

-- 7.  List authors who have not written any books. 

    SELECT AUTHORNAME,TITLE
    FROM BOOK B
    JOIN AUTHOR A
    ON B.PUBLISHERID = A.PUBLISHERID
    WHERE TITLE IS NULL
    

-- 8.  Display the total number of books written by each author along with the average price of their books. 

    SELECT AUTHORNAME,COUNT(TITLE),AVG(PRICE)
    FROM BOOK B
    JOIN AUTHOR A
    ON B.PUBLISHERID = A.PUBLISHERID
    GROUP by AUTHORNAME
    

-- 9.  lists each publisher along with the total number of books they have published, sorted from highest to 
-- lowest. 

    SELECT AUTHORNAME,COUNT(TITLE) AS COUNT_TITLE FROM BOOK B
    JOIN AUTHOR A
    ON B.PUBLISHERID = A.PUBLISHERID
    GROUP BY AUTHORNAME
    order BY COUNT_TITLE DESC

-- 10. Display number of books published each year. 

    SELECT PUBLICATIONYEAR,COUNT(TITLE) FROM BOOK B
    JOIN PUBLISHER P
    ON B.PUBLISHERID = P.PUBLISHERID
    GROUP BY PUBLICATIONYEAR

 
-- Part – B:  
-- 11. List the publishers whose total book prices exceed 500, ordered by the total price. 

    SELECT PUBLISHERNAME,SUM(PRICE) FROM BOOK B
    JOIN PUBLISHER P
    ON B.PUBLISHERID = P.PUBLISHERID
    GROUP BY PUBLISHERNAME
    HAVING SUM(PRICE) > 500
    ORDER BY SUM(PRICE)

-- 12. List most expensive book for each author, sort it with the highest price. 

    SELECT AUTHORNAME,AUTHORNAME,MAX(PRICE) FROM BOOK B
    JOIN AUTHOR A
    ON B.AUTHORID = A.AUTHORID
    GROUP BY AUTHORNAME
    ORDER BY MAX(PRICE) DESC

-- 13. Display publisher name and difference between maximum and minimum book price.

    SELECT PUBLISHERNAME,MAX(PRICE)-MIN(PRICE) FROM BOOK B
    JOIN PUBLISHER P
    ON B.PUBLISHERID = P.PUBLISHERID
    GROUP BY PUBLISHERNAME


-- 14. List publisher name and total price of books published each year. 

    SELECT PUBLISHERNAME,PUBLICATIONYEAR,COUNT(PRICE) FROM BOOK B
    JOIN PUBLISHER P
    ON B.PUBLISHERID = P.PUBLISHERID
    GROUP BY PUBLISHERNAME,PUBLICATIONYEAR

-- 15. Display author name and total price of books sorted by highest total price. 

     SELECT AUTHORNAME,SUM(PRICE) FROM BOOK B
    JOIN AUTHOR A
    ON B.AUTHORID = A.AUTHORID
    GROUP BY AUTHORNAME
    ORDER BY SUM(PRICE)



-- Part – C: 

CREATE TABLE EMPLOYEE_MASTER(
         EmployeeNo VARCHAR(10),
         Name VARCHAR(10),
         ManagerNo VARCHAR(10)
);

INSERT INTO EMPLOYEE_MASTER VALUES
('E01','Tarun',NULL),
('E02','Rohan','E02'),
('E03','Priya','E01'),
('E04','Milan','E03'),
('E05','Jay','E01'),
('E06','Anjana','E04');

SELECT * FROM EMPLOYEE_MASTER

-- 16. Retrieve the names of employee along with their manager’s name from the Employee table.

    SELECT E2.Name,E1.Name FROM EMPLOYEE_MASTER E1
    JOIN EMPLOYEE_MASTER E2
    ON E1.ManagerNo = E2.EmployeeNo



-- 17. Display employees who are managers. 

    SELECT DISTINCT E2.Name FROM EMPLOYEE_MASTER E1
    JOIN EMPLOYEE_MASTER E2
    ON E1.ManagerNo = E2.ManagerNo

-- 18. Display number of employees working under each manager. 

    SELECT COUNT(E1.EmployeeNo) FROM EMPLOYEE_MASTER E1
    JOIN EMPLOYEE_MASTER E2
    ON E1.ManagerNo = E2.EmployeeNo
    GROUP BY E2.Name


-- 19. Display the employee’s name along with their manager’s name and senior manager name. 

    SELECT E.Name,M.Name,SM.Name FROM EMPLOYEE_MASTER E
    LEFT  JOIN EMPLOYEE_MASTER M
    ON E.ManagerNo = M.EmployeeNo
    LEFT  JOIN EMPLOYEE_MASTER SM
    ON M.ManagerNo = SM.EmployeeNo


-- 20. Display managers and count of employees under them in descending order. 

     SELECT COUNT(E1.EmployeeNo) FROM EMPLOYEE_MASTER E1
    JOIN EMPLOYEE_MASTER E2
    ON E1.ManagerNo = E2.EmployeeNo
    GROUP BY E2.Name
    ORDER BY COUNT(E1.EmployeeNo) DESC
