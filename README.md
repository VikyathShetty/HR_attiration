
# Attrition

The HR dataset is designed to analyze and predict employee behavior within a company, specifically focusing on whether an employee is likely to stay or leave the organization. This analysis is based on various factors that influence employee satisfaction, performance, and engagement. By leveraging these insights, businesses can make informed decisions to enhance employee retention strategies and address potential concerns proactively.


## Key Columns in the Dataset


The dataset comprises 44 columns, with the analysis focusing primarily on the most relevant columns rather than utilizing all available columns.

### Demographic Information:

**Gender**: Male or Female.

**Marital Status:** Single, Married, or Divorced.
### Job and Role Details:

**Department:** The department in which the employee works (e.g., Research Scientist, Sales, Laboratory Technician).

**Job Role:** Specific designation or role of the employee.

**Business Travel:** Frequency of business travel (e.g., Rarely, Frequently).


### Location and Distance:
**Distance From Office:** Distance between the employee's residence and workplace.

### Compensation and Benefits:

**Salary:** Salary level or band of the employee.

**Overtime:** Whether the employee works overtime (Yes/No).
### Job Satisfaction and Engagement:

**Job Satisfaction:** A rating of how satisfied an employee is with their job.

**Work-Life Balance:** An employee's perception of work-life balance.

### Performance and Growth:

**Years at the Company:** Total number of years the employee has been with the organization.

**Years in Current Role:** Number of years in the current position.

**Years Since Last Promotion:** Time elapsed since the last promotion.

### Workload and Hours:

**Total Working Time in the Company:** Total hours worked by the employee during their tenure.

### Key Metrics and Indicators:

**Attrition:** Indicates whether the employee has left the company (Yes/No).

[Dataset](https://github.com/VikyathShetty/HR_attiration-Data-Analysis)

**Key Performance Indicators (KPIs)** are critical metrics that help measure and analyze the performance of employees and identify factors contributing to attrition.


**SQL-Based Analysis:**
 Examining How Key Columns Contribute to Attrition
Using SQL, the relationship between key columns and employee attrition is analyzed to uncover patterns and insights. This approach helps identify the most significant factors driving attrition and enables data-driven decision-making.

The analysis focuses on the following columns, which play a critical role in understanding attrition:

Attrition (Target column),Business Travel,Department,Distance From Office,Gender,Salary,Job Satisfaction,Marital Status,Overtime,Years at Company,Promotion,Work-Life Balance,Age Group


## DAX Measure and Calculated Columns in PowerBI


To analyze and summarize employee work-life status based on a **WorkLifeBalance column**, you can create a measure that groups employees into categories such as "Very Bad," "Bad," "Good," or "Very Good" (based on numeric or categorical data in the column).

If the WorkLifeBalance column contains numeric values (e.g., 1 = Very Bad, 2 = Bad, etc.)

Using the newly created **Age Range column** we can derive additional metrics and perform more focused analyses.
Analyze the number of employees leaving the company within each age range.

In this project, we calculate key metrics such as the **total employee count** and **attrition rate** using DAX measures in Power BI. These metrics are essential for understanding workforce dynamics and are presented visually for clarity and actionable insights.


## PowerBI Report

![PowerBI Report](https://github.com/VikyathShetty/HR_attiration-Data-Analysis/blob/main/images/Screenshot%202024-12-11%20080838.png)


### Skills

**Data Analysis and Interpretation**

Identifying key factors influencing attrition.
Analyzing employee behavior using statistical and analytical techniques.

**Data Modeling and Transformation**

Merging and cleaning datasets for consistency.
Creating calculated columns and measures in Power BI using DAX.

**Visualization and Reporting**

Designing dynamic dashboards and reports in Power BI.
Employing slicers, cards, and charts for interactive visual exploration.

**Domain Knowledge**

Understanding employee retention, attrition, and HR metrics.
Leveraging key performance indicators (KPIs) for decision-making.

### Technologies
**Power BI**

Used for creating interactive dashboards and reports.
Key Features Utilized: DAX measures, calculated columns, card visuals, and interactive slicers.

**DAX (Data Analysis Expressions)**

Creating measures for KPIs like total employees, attrition count, attrition rate, and more.
Writing expressions for calculated columns like Age Range and measures for Work-Life Balance and Performance Rating.

**SQL**

Querying data to examine relationships between columns influencing attrition.
Aggregating and transforming data for integration into Power BI.

**Data Visualization Tools**

Stacked Column Charts: Comparing metrics like job satisfaction across departments or age groups.

Cards: Displaying KPIs such as total employees,attrition percent and attrition count.

Pie Charts: Representing categorical data like attrition distribution by overtime and attiration based on satisfaction

Donut Chart: Representing categorical data like attirition based on gender

Matrix : Representing Attiration based on Job role and Job Satisfaction

Stacked Area Chart : Attiration based on worklife balance and gender

Slicer: Slicer is applied for department








