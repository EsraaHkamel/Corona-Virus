
-- To avoid any errors, check missing value / null value 
-- Q1. Write a code to check NULL values
SELECT
	SUM(Case WHEN Province IS NULL THEN 1 ELSE 0 END) AS Province,
	SUM(Case WHEN Country_Region IS NULL THEN 1 ELSE 0 END) AS Country_Region,
	SUM(Case WHEN Latitude IS NULL THEN 1 ELSE 0 END) AS Latitude,
	SUM(Case WHEN Longitude IS NULL THEN 1 ELSE 0 END) AS Longitude,
	SUM(Case WHEN Date IS NULL THEN 1 ELSE 0 END) AS Date,
	SUM(Case WHEN Confirmed IS NULL THEN 1 ELSE 0 END) AS Confirmed,
	SUM(Case WHEN Deaths IS NULL THEN 1 ELSE 0 END) AS Deaths,
	SUM(Case WHEN Recovered IS NULL THEN 1 ELSE 0 END) AS Recovered
FROM [Corona ];
--Q2. If NULL values are present, update them with zeros for all columns. 
UPDATE [Corona ]
SET Province = ISNULL(Province, ''),
    Country_Region = ISNULL(Country_Region, ''),
    Latitude = ISNULL(Latitude, 0),
    Longitude = ISNULL(Longitude, 0),
    Date = ISNULL(CONVERT(VARCHAR(10), Date, 120), ''), 
    Confirmed = ISNULL(Confirmed, 0),
    Deaths = ISNULL(Deaths, 0),
    Recovered = ISNULL(Recovered, 0);
-- Q3. check total number of rows
SELECT Count (*) AS Total_rows
From [Corona ];
-- Q4. Check what is start_date and end_date
SELECT FORMAT(MIN(CONVERT(DATE,Date,105)),'dd/MM/yyyy') AS Start_date,
	   FORMAT(MAX(CONVERT(DATE,Date,105)),'dd/MM/yyyy') AS End_date
FROM [Corona ];
-- Q5. Number of month present in dataset
SELECT YEAR(Date) AS Year,
	   COUNT(DISTINCT MONTH(Date)) AS Number_of_month
FROM [Corona ]
GROUP BY YEAR(Date)
ORDER BY Year;
-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT  YEAR(Date) AS Year,
		MONTH(Date) AS Month,
		AVG(Confirmed) AS Avg_Confirmed,
		AVG(Deaths) AS Avg_Deaths,
		AVG(Recovered) AS Avg_Recovered
FROM [Corona ]
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;
-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT YEAR(Date) AS Year,
	   MONTH(Date) AS Month,
	   MAX(Confirmed) AS Most_Frequent_Confirmed,
	   MAX(Deaths) AS Most_Frequent_Deaths,
	   MAX(Recovered) AS Most_Frequent_Recovered
FROM [Corona ]
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;
-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT YEAR(Date) AS Year,
	   MIN(Confirmed) AS Min_Confirmed,
	   MIN(Deaths) AS Min_Deaths,
	   MIN(Recovered) AS Min_Recovered
FROM [Corona ]
GROUP BY YEAR(Date)
ORDER BY Year;
-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT YEAR(Date) AS Year,
       MAX(Confirmed) AS Max_Confirmed,
       MAX(Deaths) AS Max_Deaths,
       MAX(Recovered) AS Max_Recovered
FROM [Corona ]
GROUP BY YEAR(Date)
ORDER BY Year;
-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT	YEAR(Date) AS Year,
		MONTH(Date) AS Month,
		SUM(Confirmed) AS Total_Confirmed,
		SUM(Deaths) AS Total_Deaths,
		SUM(Recovered) AS Total_Recovered
FROM [Corona ]
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;
-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT YEAR(Date) AS Year,
	   MONTH(Date) AS Month,
	   SUM(Confirmed) AS Total_Confirmed_Cases,
	   AVG(Confirmed) AS Average_Confirmed_Cases,
	   ROUND(VAR(Confirmed),1) AS Variance_Confirmed_Cases,
	   ROUND(STDEV(Confirmed),1) AS Stdev_Confirmed_Cases
FROM [Corona ]
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;
-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total death cases, their average, variance & STDEV )
SELECT YEAR(Date) AS Year,
	   MONTH(Date) AS Month,
	   SUM(Deaths) AS Total_Deaths_Cases,
	   AVG(Deaths) AS Average_Deaths_Cases,
	   ROUND(VAR(Deaths),1) AS Variance_Deaths_Cases,
	   ROUND(STDEV(Deaths),1) AS Stdev_Deaths_Cases
FROM [Corona ]
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;
-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total recovered cases, their average, variance & STDEV )
SELECT YEAR(Date) AS Year,
	   MONTH(Date) AS Month,
	   SUM(Recovered) AS Total_Recovered_Cases,
	   AVG(Recovered) AS Average_Recovered_Cases,
	   ROUND(VAR(Recovered),1) AS Variance_Recovered_Cases,
	   ROUND(STDEV(Recovered),1) AS Stdev_Recovered_Cases
FROM [Corona ]
GROUP BY Year(Date), MONTH(Date)
ORDER BY Year, Month;
-- Q14. Find Country having highest number of the Confirmed case
SELECT TOP 1 Country_Region, MAX(Confirmed) AS Highest_Confirmed_Cases
FROM [Corona ]
GROUP BY Country_Region
ORDER BY MAX(Confirmed) DESC;
-- Q15. Find Country having lowest number of the death case
SELECT TOP 1 Country_Region, MIN(deaths) AS lowest_Deaths_cases
FROM [Corona ]
GROUP BY Country_Region
ORDER BY MIN(deaths) ASC;
-- Q16. Find top 5 countries having highest recovered case
SELECT TOP 5 Country_Region, MAX(Recovered) AS Total_Recovered_Cases
FROM [Corona ]
GROUP BY Country_Region
ORDER BY MAX(Recovered) DESC;


