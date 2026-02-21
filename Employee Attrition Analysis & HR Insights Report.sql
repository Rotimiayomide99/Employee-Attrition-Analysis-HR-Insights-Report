SELECT * FROM dbo.HRdata

1. TOTAL EMPLOYEES
SELECT COUNT(*) AS Total_Employees
FROM HRDATA

2. TOTAL ATTRITION (Employees Who Left)
SELECT COUNT(*) AS Total_Attrition FROM HRDATA
WHERE Attrition = 1

3. ATTRITION RATE %
SELECT 
    CAST(
        SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
    AS DECIMAL(5,2)) AS Attrition_Rate_Percentage
FROM HRDATA;

4. CURRENT EMPLOYEES
SELECT COUNT(*) AS Current_Employees FROM HRDATA
WHERE Attrition = 0

5. AVERAGE STAFFS AGE
SELECT AVG(AGE) AS Average_Age FROM HRDATA


6. ATTRITION BY GENDER
SELECT 
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Attrition_Count,
    CAST(
        SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
    AS DECIMAL(5,2)) AS Attrition_Rate
FROM HRDATA
GROUP BY Gender
ORDER BY Attrition_Rate DESC;

7. ATTRITION BY DEPARTMENT
SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Attrition_Count,
    CAST(
        SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
    AS DECIMAL(5,2)) AS Attrition_Rate
FROM HRDATA
GROUP BY Department
ORDER BY Attrition_Rate DESC;

8. ATTRITION BY EDUCATION FIELD
SELECT 
    Education_Field,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Attrition_Count,
    CAST(
        SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
    AS DECIMAL(5,2)) AS Attrition_Rate
FROM HRDATA
GROUP BY Education_Field
ORDER BY Attrition_COUNT DESC;

9.AGE GROUP ANALYSIS
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Attrition_Count,
    CAST(
        SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
    AS DECIMAL(5,2)) AS Attrition_Rate
FROM HRDATA
GROUP BY 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '55+'
    END
ORDER BY Age_Group;

10. JOB ROLE ATTRITION
SELECT 
    Job_Role,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Attrition_Count,
    CAST(
        SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
    AS DECIMAL(5,2)) AS Attrition_Rate
FROM HRDATA
GROUP BY Job_Role
ORDER BY Attrition_Rate DESC;

11. ATTRITION BY GENDER AND AGE GROUP
SELECT 
    Gender,
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE 'Over 54'
    END AS Age_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) 
        AS Attrition_Count,

    CAST(
        SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
    AS DECIMAL(5,2)) 
        AS Attrition_Rate_Percentage

FROM HRDATA

GROUP BY 
    Gender,
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE 'Over 54'
    END

ORDER BY Gender, Age_Group;