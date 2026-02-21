📊 HR Attrition Analysis Using SQL (SSMS)
📌 Problem Statement

Employee attrition significantly affects organizational stability, productivity, and operational costs. High turnover leads to increased recruitment expenses, loss of institutional knowledge, and reduced team performance.

The organization needs data-driven insights to:

Determine the overall attrition rate

Identify demographic segments with high turnover

Analyze attrition trends by gender and age group

Evaluate department and job role impact

Support strategic HR retention decisions

Without structured analysis, management cannot identify patterns or implement effective retention strategies.

🎯 Aim of the Project

The aim of this project is to analyze HR employee data using Microsoft SQL Server (SSMS) to:

Measure total workforce and attrition levels

Calculate attrition rate percentage

Identify high-risk demographic groups

Analyze attrition across departments, education fields, and job roles

Provide actionable insights for HR decision-making

🛠 Tools Used

Microsoft SQL Server (SSMS)

Excel (Raw HR Dataset)

T-SQL

📂 Data Source
SELECT * FROM dbo.HRDATA
📊 SQL Analysis Queries
1️⃣ Total Employees
SELECT COUNT(*) AS Total_Employees
FROM HRDATA
2️⃣ Total Attrition (Employees Who Left)
SELECT COUNT(*) AS Total_Attrition 
FROM HRDATA
WHERE Attrition = 1
3️⃣ Attrition Rate %
SELECT 
    CAST(
        SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
    AS DECIMAL(5,2)) AS Attrition_Rate_Percentage
FROM HRDATA;
4️⃣ Current Employees
SELECT COUNT(*) AS Current_Employees 
FROM HRDATA
WHERE Attrition = 0
5️⃣ Average Staff Age
SELECT AVG(AGE) AS Average_Age 
FROM HRDATA
6️⃣ Attrition by Gender
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
7️⃣ Attrition by Department
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
8️⃣ Attrition by Education Field
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
9️⃣ Age Group Analysis
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
🔟 Job Role Attrition
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
1️⃣1️⃣ Attrition by Gender and Age Group
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
    SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Attrition_Count,
    CAST(
        SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
    AS DECIMAL(5,2)) AS Attrition_Rate_Percentage
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
📈 Business Impact

This analysis enables HR teams to:

Identify high-risk age groups and departments

Understand gender-based attrition trends

Improve workforce planning

Develop targeted retention strategies

Reduce turnover-related costs
