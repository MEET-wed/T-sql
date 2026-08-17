-- art – A: 
-- 1.  Display all students whose SPI is greater than 8.

    WITH SPIG8 AS
    (
        SELECT * FROM STUDENT
        WHERE SPI > 8
    )
    SELECT * FROM STUDENT

-- 2.  Display average SPI of all students.
 
    WITH AVG_SPI AS 
    (
        SELECT AVG(SPI) AS ASPI FROM STUDENT
    )
    SELECT * FROM AVG_SPI


-- 3.  Display total number of students in each branch.

    WITH GROUP_BRANCH AS 
    (
        SELECT BRANCH,COUNT(*) AS CO  FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM GROUP_BRANCH


-- 4.  Display students who belong to RAJKOT city.

    WITH CST AS
    (
        SELECT * FROM STUDENT
        WHERE CITY = 'RAJKOT'
    )
    SELECT * FROM CST

-- 5.  Find branch names that appear more than once.

     WITH GROUP_BRANCH AS 
    (
        SELECT BRANCH,COUNT(*) AS CO  FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM GROUP_BRANCH
    WHERE CO > 1

-- 6.  Display row number for each student. 

        WITH NUM AS
        (
            SELECT STDID,SNAME,BRANCH,
            ROW_NUMBER() OVER(ORDER BY SPI DESC) AS RN
             FROM STUDENT
        )
        SELECT * FROM NUM

-- 7.  Display top 3 students based on SPI.

    WITH NUM AS
        (
            SELECT STDID,SNAME,BRANCH,
            DENSE_RANK() OVER(ORDER BY SPI DESC) AS RN
             FROM STUDENT
        )
        SELECT * FROM NUM
        WHERE RN < 4

-- 8.  Display students having maximum SPI.

     WITH MAX_SPI AS 
    (
        SELECT MAX(SPI) AS ASPI FROM STUDENT
    )
    SELECT * FROM MAX_SPI

-- 9.  Display students having minimum SPI.

     WITH MIN_SPI AS 
    (
        SELECT MIN(SPI) AS ASPI FROM STUDENT
    )
    SELECT * FROM MIN_SPI


-- 10. Display branch -wise rank of students. 

     WITH NUM AS
        (
            SELECT STDID,SNAME,BRANCH,
            RANK() OVER(PARTITION BY BRANCH ORDER BY SPI DESC) AS RN
             FROM STUDENT
        )
        SELECT * FROM NUM


 
-- Part – B: 
-- 11. Display students SPI average belonging to Computer branch. 

    WITH ABC AS
    (
        SELECT BRANCH,AVG(SPI) AS AVG_SPI FROM STUDENT
        GROUP BY BRANCH
        HAVING BRANCH = 'COMPUTER'
    )
    SELECT * FROM ABC


-- 12. Display students whose SPI is greater than average SPI of his/her branch.

     WITH ABC AS
    (
        SELECT BRANCH,AVG(SPI) AS AVG_SPI FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM ABC A
    JOIN STUDENT S
    ON A.BRANCH = S.BRANCH
    WHERE S.SPI > A.AVG_SPI

   

-- 13. Display branch having more than 2 students.

     WITH GROUP_BRANCH AS 
    (
        SELECT BRANCH,COUNT(*) AS CO  FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM GROUP_BRANCH
    WHERE CO > 2

-- 14. Display branches having average SPI between 7 and 9 

     WITH ABC AS
    (
        SELECT BRANCH,AVG(SPI) AS AVG_SPI FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM ABC
    WHERE AVG_SPI BETWEEN 7 AND 9

-- 15. Display students whose SPI is lower than overall average SPI.

     WITH ABC AS
    (
        SELECT BRANCH,AVG(SPI) AS AVG_SPI FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM ABC A
    JOIN STUDENT S
    ON A.BRANCH = S.BRANCH
    WHERE S.SPI < A.AVG_SPI




-- Part – C: 
-- 16. Display branches having exactly one student.

     WITH GROUP_BRANCH AS 
    (
        SELECT BRANCH,COUNT(*) AS CO  FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM GROUP_BRANCH
    WHERE CO = 1


-- 17. Display branch having highest average SPI.

     WITH ABC AS
    (
        SELECT BRANCH,AVG(SPI) AS AVG_SPI, 
        RANK() OVER(ORDER BY AVG(SPI) DESC) AS RA
        FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM ABC
    WHERE RA = 1 

-- 18. Display branch having lowest average SPI.

      WITH ABC AS
    (
        SELECT BRANCH,AVG(SPI) AS AVG_SPI, 
        RANK() OVER(ORDER BY AVG(SPI) ASC) AS RA
        FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM ABC
    WHERE RA = 1 


-- 19. Display students whose SPI is lower than branch average SPI.

     WITH ABC AS
    (
        SELECT BRANCH,AVG(SPI) AS AVG_SPI FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM ABC A
    JOIN STUDENT S
    ON A.BRANCH = S.BRANCH
    WHERE S.SPI < A.AVG_SPI

-- 20. Display branches having maximum number of students. 

    WITH BRANCH_COUNT AS
    (
        SELECT BRANCH,COUNT(STDID) AS STD_COUNT FROM STUDENT
        GROUP BY BRANCH
    )
    SELECT * FROM BRANCH_COUNT
    ORDER BY STD_COUNT DESC
