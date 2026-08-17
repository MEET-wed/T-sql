-- Part – A: 
    SELECT * FROM STUDENT
-- 1.  Display rank of students based on SPI. 

    SELECT STDID,SNAME,SPI,
    RANK() OVER(ORDER BY SPI DESC)
    FROM STUDENT


-- 2.  Display dense rank of students based on SPI.

     SELECT STDID,SNAME,SPI,
    DENSE_RANK() OVER(ORDER BY SPI DESC)
    FROM STUDENT
    

-- 3.  Display sequential number for each student record.

     SELECT STDID,SNAME,SPI,
    ROW_NUMBER() OVER(ORDER BY SPI DESC)
    FROM STUDENT

-- 4.  Display branch-wise rank of students.

     SELECT STDID,SNAME,SPI,BRANCH,
    RANK() OVER(PARTITION BY BRANCH ORDER BY SPI DESC)
    FROM STUDENT



-- 5.  Display branch-wise dense ranking of students.

    SELECT STDID,SNAME,SPI,BRANCH,
    DENSE_RANK() OVER(PARTITION BY BRANCH ORDER BY SPI DESC)
    FROM STUDENT

-- 6.  Display branch-wise sequential numbering of students. 

    SELECT STDID,SNAME,SPI,BRANCH,
    ROW_NUMBER() OVER(PARTITION BY BRANCH ORDER BY SPI DESC)
    FROM STUDENT

-- 7.  Display SNAME, Current SPI, Previous SPI and SPI Difference with previous student in ascending order of 
-- SPI. 

    SELECT SNAME,SPI,
    LAG(SPI) OVER(ORDER BY SPI ASC),
    SPI-LAG(SPI) OVER(ORDER BY SPI ASC)
     FROM STUDENT

-- 8.  Display SNAME, Current SPI, Next SPI and SPI Difference with next student in descending order of SPI.

     SELECT SNAME,SPI,
    LEAD(SPI) OVER(ORDER BY SPI DESC),
    SPI-LEAD(SPI) OVER(ORDER BY SPI DESC)
     FROM STUDENT

-- 9.  Display top 3 students based on SPI. 

    SELECT * FROM(
    SELECT *, RANK() OVER(ORDER BY SPI) RN 
    FROM STUDENT
    ) A
    WHERE RN <=3

-- 10. Display top 2 students from each branch.

    SELECT * FROM(
    SELECT *, RANK() OVER(PARTITION BY BRANCH ORDER BY SPI) RN 
    FROM STUDENT
    ) A
    WHERE RN <=2
    

 
-- Part – B: 
-- 11. Display 5th highest SPI. 

    SELECT * FROM(
    SELECT *, DENSE_RANK() OVER(ORDER BY SPI DESC) RN 
    FROM STUDENT
    ) A
    WHERE RN = 5
    

-- 12. Display 6th highest SPI.

    SELECT * FROM(
    SELECT *, DENSE_RANK() OVER(ORDER BY SPI DESC) RN 
    FROM STUDENT
    ) A
    WHERE RN = 6

-- 13. Display students having same ranking. 

   SELECT * FROM(
    SELECT *, DENSE_RANK() OVER(ORDER BY SPI DESC) RN
    FROM STUDENT
    ) A
    WHERE RN IN (
        SELECT RN
        FROM (
            SELECT DENSE_RANK() OVER(ORDER BY SPI DESC) RN
            FROM STUDENT
        ) X
        GROUP BY RN
        HAVING COUNT(*) > 1
    )
    ORDER BY RN, SPI DESC

-- 14. Display SNAME, Previous SPI, Current SPI and Next SPI based on ascending order of SPI.

    SELECT SNAME,
    LAG(SPI) OVER(ORDER BY SPI ASC),
    SPI,
    LEAD(SPI) OVER(ORDER BY SPI ASC)
    FROM STUDENT

-- 15. Display topper of each branch.

   SELECT * FROM(
    SELECT *, RANK() OVER( PARTITION BY BRANCH ORDER BY SPI DESC) RN 
    FROM STUDENT
    ) A
    WHERE RN = 1

 
-- Part – C: 
-- 16. Display students whose SPI is greater than the previous student and less than the next student. 

    SELECT * FROM(
    SELECT *, 
    LEAD(SPI) OVER(ORDER BY SPI) AS PSPI,
    LAG(SPI) OVER(ORDER BY SPI) AS NSPI
    FROM STUDENT
    ) A
    WHERE SPI > NSPI AND SPI < PSPI 
    


-- 17. Display branch-wise second topper students.

    SELECT * FROM(
    SELECT *, DENSE_RANK() OVER( PARTITION BY BRANCH ORDER BY SPI DESC) RN 
    FROM STUDENT
    ) A
    WHERE RN = 2


-- 18. Display students whose rank and dense rank are different.

     SELECT * FROM(
    SELECT *, 
        DENSE_RANK() OVER(ORDER BY SPI DESC) DRN, 
        RANK() OVER(ORDER BY SPI DESC) RN 
    FROM STUDENT
    ) A
    WHERE  RN <> DRN

-- 19. Display consecutive students having same branch ordered by SPI.

    SELECT * FROM(
    SELECT *, 
        LEAD(BRANCH) OVER (ORDER BY SPI ) NB
    FROM STUDENT
    ) A
    WHERE  BRANCH = NB

-- 20. Display students whose SPI difference with previous student is maximum. 

    SELECT SNAME,NB FROM(

        SELECT *,
        SPI- LAG(SPI) OVER (ORDER BY SPI ) NB
        FROM STUDENT
    )A
    WHERE NB = (
    SELECT MAX(NB) 
    FROM(
         SELECT *,
        SPI- LAG(SPI) OVER (ORDER BY SPI ) NB
        FROM STUDENT
    ) X)