-- Part – A: 

    SELECT * FROM STUDENT

-- 1.  Display the details of students whose SPI is greater than the average SPI. 

    SELECT  SNAME,SPI FROM STUDENT
    WHERE SPI > ( SELECT AVG(SPI) FROM STUDENT )

-- 2.  Display the names of students whose SPI is less than the average SPI. 

    SELECT  SNAME,SPI FROM STUDENT
    WHERE SPI < ( SELECT AVG(SPI) FROM STUDENT )

-- 3.  Display the student details who has the highest SPI.

    SELECT * FROM STUDENT
    WHERE SPI = (SELECT MAX(SPI) FROM STUDENT)


-- 4.  Display the student details who has the lowest SPI. 

    
    SELECT * FROM STUDENT
    WHERE SPI = (SELECT MIN(SPI) FROM STUDENT)

-- 5.  Display the students whose SPI is greater than SPI of student DHARMIK.

    SELECT SNAME,SPI FROM STUDENT
    WHERE SPI > (SELECT SPI FROM STUDENT
                 WHERE SNAME = 'DHARMIK')

-- 6.  Display the students whose SPI is less than SPI of student RIYA. 

    SELECT SNAME,SPI FROM STUDENT
    WHERE SPI < (SELECT SPI FROM STUDENT
                 WHERE SNAME = 'RIYA')

-- 7.  Display the students who belong to the same branch as KRUNAL.

    SELECT * FROM STUDENT
    WHERE BRANCH = (SELECT BRANCH FROM STUDENT
                    WHERE SNAME = 'KRUNAL')

-- 8.  Display the students whose branch is different from HETVI.

    SELECT * FROM STUDENT
    WHERE BRANCH <> (SELECT BRANCH FROM STUDENT
                    WHERE SNAME = 'HETVI')

-- 9.  Display the second highest SPI from RESULT table.

    SELECT MAX(SPI) FROM STUDENT
    WHERE SPI < ( SELECT MAX(SPI) FROM STUDENT)


-- 10. Display the second lowest SPI from RESULT table. 

      SELECT MIN(SPI) FROM STUDENT
    WHERE SPI < ( SELECT MIN(SPI) FROM STUDENT)

-- 11. Display the names of students whose SPI is above branch-wise average SPI. 

   SELECT * FROM STUDENT S1
   WHERE SPI > (SELECT AVG(SPI) FROM STUDENT S2
                WHERE S1.BRANCH = S2.BRANCH 
                )


-- 12. Display the branch having maximum average SPI. 

    
   SELECT BRANCH,MAX(SPI) FROM STUDENT S1
   WHERE SPI > (SELECT AVG(SPI) FROM STUDENT S2
                WHERE S1.BRANCH = S2.BRANCH 
                )
    GROUP BY BRANCH

-- 13. Display the branch having minimum average SPI.  

    
   SELECT BRANCH,MAX(SPI) FROM STUDENT S1
   WHERE SPI < (SELECT AVG(SPI) FROM STUDENT S2
                WHERE S1.BRANCH = S2.BRANCH 
                )
    GROUP BY BRANCH
 
-- From the table STUDENT_INFO and RESULT perform the following queries:  
-- Part – B: 
-- 14. Display the students whose SPI is greater than all students of ME branch. 

    SELECT DISTINCT S1.NAME ,R1.SPI FROM STUDENT_INFO S1
    JOIN RESULT R1
    ON S1.RNO = R1.RNO
    WHERE R1.SPI > ANY (
        SELECT  R2.SPI FROM STUDENT_INFO S2
        JOIN RESULT R2
        ON S2.RNO = R2.RNO 
        WHERE S2.BRANCH = 'ME'  
    )


-- 15. Display the students whose SPI is less than any student of ME branch.

    
    SELECT DISTINCT S1.NAME ,R1.SPI FROM STUDENT_INFO S1
    JOIN RESULT R1
    ON S1.RNO = R1.RNO
    WHERE R1.SPI < ANY (
        SELECT  R2.SPI FROM STUDENT_INFO S2
        JOIN RESULT R2
        ON S2.RNO = R2.RNO 
        WHERE S2.BRANCH = 'ME'  
    )


-- 16. Display the student details whose SPI is not equal to any SPI of EC branch students. 


     SELECT DISTINCT * FROM STUDENT_INFO S1
    JOIN RESULT R1
    ON S1.RNO = R1.RNO
    WHERE R1.SPI <>  (
        SELECT  R2.SPI FROM STUDENT_INFO S2
        JOIN RESULT R2
        ON S2.RNO = R2.RNO 
        WHERE S2.BRANCH = 'EC'  
    )



-- 17. Display the names of students who scored higher SPI than student of RNO 103.

     SELECT * FROM STUDENT_INFO S1
    JOIN RESULT R1
    ON S1.RNO = R1.RNO
    WHERE R1.SPI > ANY (
        SELECT  R2.SPI FROM STUDENT_INFO S2
        JOIN RESULT R2
        ON S2.RNO = R2.RNO 
        WHERE S2.RNO = 103  
    )

-- 18. Display the students whose SPI is greater than average SPI of their own branch. 

      SELECT * FROM STUDENT_INFO S1
    JOIN RESULT R1
    ON S1.RNO = R1.RNO
    WHERE R1.SPI > ANY (
        SELECT  AVG(R2.SPI) FROM STUDENT_INFO S2
        JOIN RESULT R2
        ON S2.RNO = R2.RNO 
        WHERE S2.BRANCH = S1.BRANCH 
    )

-- 19. Display the students whose SPI is greater than the average SPI of CE branch but greater than the 
-- maximum SPI of ME branch. 

      SELECT * FROM STUDENT_INFO S1
    JOIN RESULT R1
    ON S1.RNO = R1.RNO
    WHERE R1.SPI > ANY (
        SELECT  AVG(R2.SPI) FROM STUDENT_INFO S2
        JOIN RESULT R2
        ON S2.RNO = R2.RNO 
        WHERE S2.BRANCH = 'CE' OR R2.SPI > ( SELECT  MAX(R2.SPI) FROM STUDENT_INFO S2
        JOIN RESULT R2
        ON S2.RNO = R2.RNO 
        WHERE S2.BRANCH = 'ME')
    )

-- 20. Display the branch names whose average SPI is greater than the overall average SPI. 

    SELECT BRANCH,AVG(R.SPI) FROM STUDENT_INFO S
    JOIN RESULT R
    ON S.RNO = R.RNO
    WHERE SPI > ( SELECT DISTINCT AVG(R.SPI) FROM STUDENT_INFO S1
    JOIN RESULT R1
    ON S1.RNO = R1.RNO
    )
