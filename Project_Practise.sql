USE Project_HR;

SELECT * 
FROM dbo.attiration;

SELECT * 
FROM ATTIRATION;

--is a conditional expression in SQL, specifically a CASE statement, and it�s typically used within aggregate
-- functions like SUM, COUNT, or other expressions where you need to apply logic to your data
SELECT COUNT(*) AS 'TOTAL_EMPLOYEES',
COUNT(CASE WHEN Attrition = 'YES' THEN 1 END ) AS ATTIRATIONCOUNT
FROM ATTIRATION;

--We check for overtime
SELECT * 
FROM attiration;

--PRESENT OF OVERTIME AND EMPLOYEES
--IF COLUMN NAME HAS SPACE
SELECT "OVER TIME" FROM ATTIRATION;

-- TO CHANGE THE OVERTIME
EXEC sp_rename 'ATTIRATION.[OVER TIME]', 'OVERTIME', 'COLUMN';

SELECT OVERTIME 
FROM ATTIRATION;

--CHANGE THE COLUMN FROM YES AND NO TO 0 AND 1
UPDATE ATTIRATION
SET OVERTIME = CASE 
                 WHEN OVERTIME = 'YES' THEN 1
                 WHEN OVERTIME = 'NO' THEN 0
                 ELSE OVERTIME  -- In case there are any other unexpected values
               END;


UPDATE ATTIRATION
SET Attrition = CASE
WHEN attrition = 'Yes' THEN 1
WHEN attrition = 'No' Then 0
ELSE attrition
END;

SELECT * FROM attiration;

--PRESENT OF ATTIRATION WHO HAVE BEEN DOING OVERTIME
SELECT COUNT(*) AS EMPLOYEE_COUNT , OVERTIME
FROM ATTIRATION
WHERE ATTRITION = 1
GROUP BY OVERTIME;

--SAMPLE
SELECT COUNT(*) AS COUNT_OF_GENDER , GENDER
FROM ATTIRATION
WHERE ATTRITION = 1
GROUP BY GENDER
HAVING GENDER = 'MALE';

----HOW MANY FEMAL EMPLOYEES ARE THERE AND HOW MANY MALE EMPLOYEES ARE THERE
SELECT GENDER , COUNT(*) AS COUNT_OF_GENDER 
FROM ATTIRATION
GROUP BY GENDER;

--HOW MANY FEMALE AND MALE EMPLOYEES HAVE LEFT THE COMPANY
SELECT GENDER , COUNT(*) AS COUNT_OF_PERSON 
FROM ATTIRATION
WHERE ATTRITION = 1
GROUP BY GENDER

--SUM OF PEOPLE WHO HAS LEFT THE COMPNAY
SELECT 
    GENDER,
    COUNT(*) AS TOTAL_PEOPLE,  -- Total count of people by gender
    SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS LEFT_COMPANY  -- Count of people who left
FROM ATTIRATION
GROUP BY GENDER;

--COUNT - Counts all the rows (people) in the table or group, without any condition. It will give you the total number of employees by gender, regardless of whether they left or not.
SELECT GENDER ,
COUNT(*) AS TOTAL_PEOPLE,
COUNT(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS LEFTTHE
FROM ATTIRATION
GROUP BY GENDER;

--SUM - Counts only the rows where the condition (ATTRITION = 1) is true. It sums the number of 1s that the CASE expression returns, effectively counting how many people have left the company (i.e., how many have ATTRITION = 1).
SELECT GENDER ,
COUNT(*) AS TOTAL_PEOPLE,
SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS LEFTTHE
FROM ATTIRATION
GROUP BY GENDER;

SELECT * FROM ATTIRATION;

--PERFORMANCE RATING ALSO MAKES A CRUCICAL FACTOR ON THIS DATA AS WELL ARE NOT 
-- TO CHECK THE DISTINCT VALUE
SELECT DISTINCT("Performance Rating")
FROM ATTIRATION;

--SELECT PERFORMANCE RATING ON THE BASIS OF COUNT
--THIS MEANS THAT THERE IS NEGATIVE CO-ORELATION AMONGST THE PERFORMANCE RATING AS RATING DECREASES ATTRITION INCREASES
SELECT "PERFORMANCE RATING" , COUNT(*) AS STAR_COUNT ,SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS ATTRI_COUNT 
FROM ATTIRATION
GROUP BY "Performance Rating";

SELECT * FROM ATTIRATION;

--WHAT ARE THE JOB ROLES WHERE MOST OF THE ATTRIOTIN HAPPEND
SELECT "JOB ROLE" , COUNT(*) AS ROLES,SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS ATTRI_COUNT
FROM ATTIRATION
GROUP BY "JOB ROLE";

--ROUND(expression, 0) rounds the result of expression to zero decimal places (i.e., it gives a whole number).
SELECT 
    "JOB ROLE", 
    COUNT(*) AS ROLES, 
    SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS ATTRI_COUNT,
    ROUND(SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 0) AS PERCENTAGE_OF_LEAVING
FROM ATTIRATION
GROUP BY "JOB ROLE";
--OR
SELECT 
    "JOB ROLE", 
    COUNT(*) AS ROLES, 
    SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS ATTRI_COUNT,
    CASE 
        WHEN COUNT(*) > 0 THEN (SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100
        ELSE 0
    END AS PERCENTAGE_OF_LEAVING
FROM ATTIRATION
GROUP BY "JOB ROLE";

--DISTANCE FROM HOME
SELECT * FROM ATTIRATION;

SELECT "DISTANCE FROM HOME" , COUNT(*) AS COUNT_VALUE
FROM ATTIRATION
WHERE Attrition = 1
GROUP BY "DISTANCE FROM HOME"
ORDER BY COUNT_VALUE DESC;

--BASED ON DEPARTMENT
--GROUP BY SHOULD BE DONE ON BOTH THE COLUMNS AND NOT ONLY ON THE 1 COLUMN
SELECT DEPARTMENT ,"JOB ROLE", COUNT(*) AS TOTAL_COUNT , SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS ATTRITION_COUNT
FROM ATTIRATION
GROUP BY DEPARTMENT,"JOB ROLE";

--SELECT PERCENT OF SALARY HIKE AND NEGATIVE COORELATION
SELECT "PERCENT SALARY HIKE", COUNT(*) AS TOTAL_COUNT , SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS ATTRI_COUNT
FROM ATTIRATION
GROUP BY "PERCENT SALARY HIKE"
ORDER BY TOTAL_COUNT DESC;

--RELATION BETWEEN YEARS IN CURRENT ROLE AND ATTIRATION COUNT
--WE ARE WRITING THE SUBQUERY TO FIND PEOPLE WORKING MORE THAN AVERAGE YEARS IN THE COMPNAY
--IN COUNT ELSE 0 IS ALSO ADDED 
SELECT "Years In Current Role",COUNT(*) AS TOTAL_COUNT,SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS ATTRI_COUNT
FROM ATTIRATION
WHERE "Years In Current Role" > (SELECT AVG("Years In Current Role") FROM ATTIRATION)
GROUP BY "Years In Current Role"
ORDER BY ATTRI_COUNT DESC;

--WE CAN ALSO DO IN THE COUNT IN THIS WAY
SELECT "Years In Current Role",COUNT(*) AS TOTAL_COUNT,COUNT(CASE WHEN ATTRITION = 1 THEN 1 END) AS ATTRI_COUNT
FROM ATTIRATION
WHERE "Years In Current Role" > (SELECT AVG("Years In Current Role") FROM ATTIRATION)
GROUP BY "Years In Current Role"
ORDER BY ATTRI_COUNT DESC;
--EMPLOYEEES WORKING IN THE LAST 5-10 YEARS HAVE HIGH ATTRI_COUNT


--SELECT THE TABLE WHICH PRINT THE 2 EMP_NO
WITH RANKED AS (
    SELECT "EMPLOYEE NUMBER",
           RANK() OVER (ORDER BY "EMPLOYEE NUMBER") AS EMP_NO
    FROM ATTIRATION
)
SELECT a.Gender, r.EMP_NO
FROM ATTIRATION a
JOIN RANKED r 
ON a."EMPLOYEE NUMBER" = r."EMPLOYEE NUMBER"
WHERE EMP_NO = 2;

--JOB SATIFACTION FROM 1 TO 4 BASED ON MONTHLY INCOME
SELECT * 
FROM ATTIRATION;

SELECT ("JOB SATISFACTION")
FROM ATTIRATION;

--FIND JOB SATISFACTION FOR THE ATTRIOTION COUNT
--PEOPLE WHO ARE NOT SATISFIED EVEN AFTER GETTING PAID MORE THAN AVERAGE SALARY
SELECT "JOB SATISFACTION",SUM(CASE WHEN ATTRITION = 1 THEN 1 ELSE 0 END) AS ATTRI_COUNT, COUNT(*) AS TOTAL_COUNT
FROM ATTIRATION
WHERE "Monthly Income">(SELECT AVG("Monthly Income") FROM attiration)
GROUP BY "JOB SATISFACTION";
--MONTHLY INCOME PLAYS A VITAL ROLE IRRESPECTIVE OF THE IRESPECTIVE OF JOB SATISFACTION

--COUNT OF ATTRITION BASED ON THE BUCKETS
--COUNT OF ATTRITION BASED ON THE AGE
SELECT   CASE WHEN AGE<= 29 THEN '18-29'
WHEN AGE >= 30 AND AGE<=39 THEN '30-39'
WHEN AGE >= 40 AND AGE<=49 THEN '40-49'
WHEN AGE >=50 AND AGE<=59 THEN '50-59'
ELSE '60 OR OLDER'
END AS 'AGE RANGE',COUNT(*) AS 'NUMBER OF ATTRITION BASED ON THE AGE RANGE'
FROM ATTIRATION 
WHERE ATTRITION = 1 AND [Years At Company]>=1
GROUP BY CASE WHEN AGE<= 29 THEN '18-29'
WHEN AGE >= 30 AND AGE<=39 THEN '30-39'
WHEN AGE >= 40 AND AGE<=49 THEN '40-49'
WHEN AGE >=50 AND AGE<=59 THEN '50-59'
ELSE '60 OR OLDER'
END
ORDER BY "AGE RANGE" DESC;
--FIRST GROUP THE DATA BASED AND THEN PERFROM THE COUNT OF THE DATA

SELECT * FROM ATTIRATION;

SELECT MAX("DAILY RATE") AS MAX_VALUE,MIN("DAILY RATE") AS MIN_VALUE,MAX("MONTHLY RATE") AS MONTH_MAX,MIN("MONTHLY RATE") AS MIN_MONTH
FROM ATTIRATION
WHERE ATTRITION = 1;

--FINDING OUT THE EMPLOYEES WHO ARE LEAVING THE COMPNAY WHO HAVE NOT MEET THE AVERAGE OF DAILY RATE AND AVERAGE OF MONTHLY RATE
--ATTRITION BASED ON BOTH THE COLUMNS
--YOU CAN ALSO INCLUDE MONTHLY INCOME
SELECT COUNT(*) AS TOTAL_COUNT
FROM ATTIRATION
WHERE ATTRITION = 1 AND "DAILY RATE" < (SELECT AVG("DAILY RATE") FROM ATTIRATION) AND "MONTHLY RATE"<(SELECT AVG("MONTHLY RATE") FROM ATTIRATION);

SELECT * FROM ATTIRATION;

--MAKE SURE TO ADD 2 COLUMNS IN GROUP BY WHEN YOU HAVE 2 COLUMNS IN SELECT STATMENT
--THIS SHOWS THAT IT IS NOT DEPENDENT ON THIS TWO VARIABLES
SELECT [Environment Satisfaction],[Relationship Satisfaction],SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS ATTRI_COUNT,COUNT(*) AS TOTAL_COUNT,
 SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)*100 / COUNT(*) AS PERCENT_COUNT
FROM ATTIRATION
WHERE  "MONTHLY INCOME" < (SELECT AVG("MONTHLY INCOME") FROM ATTIRATION)
GROUP BY [Environment Satisfaction],[Relationship Satisfaction]
ORDER BY ATTRI_COUNT DESC;
--MONTHLY INCOME OF THE COMPANY PLAYS A ROLE

SELECT * FROM ATTIRATION;

--SINGLE PEOPLE ARE CHANGING THE COMPANY  
SELECT "MARITAL STATUS" , SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS COUNT_VALUE , COUNT(*) AS TOTAL_COUNT
FROM ATTIRATION
GROUP BY "Marital Status";