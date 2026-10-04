USE urban_traffic_db;
GO
SELECT TOP 100 * FROM Urban_Traffic_Accident_Cleaned;
SELECT COUNT(*) AS Total_Accidents FROM Urban_Traffic_Accident_Cleaned;
SELECT State, 
       COUNT(Accident_ID) AS Total_Accidents,
       SUM(Persons_Killed_Simulated) AS Total_Deaths,
       SUM(Persons_Injured_Simulated) AS Total_Injured
FROM Urban_Traffic_Accident_Cleaned GROUP BY State
ORDER BY Total_Accidents DESC;
SELECT TOP 5 City,State, COUNT(*) AS Accident_Count
FROM Urban_Traffic_Accident_Cleaned
GROUP BY City, State
ORDER BY Accident_Count DESC;
SELECT Time_Period,COUNT(*) AS Total_Accidents,
SUM(Persons_Killed_Simulated) AS Fatalities
FROM Urban_Traffic_Accident_Cleaned
GROUP BY Time_Period
ORDER BY Total_Accidents DESC;
SELECT Possible_Factor_Simulated AS Reason, COUNT(*) AS Total_Cases
FROM Urban_Traffic_Accident_Cleaned GROUP BY Possible_Factor_Simulated
ORDER BY Total_Cases DESC
SELECT Weather_Condition_Simulated,Road_Type_Simulated,Accident_Severity_Simulated, COUNT(*) AS Total_Cases
FROM Urban_Traffic_Accident_Cleaned WHERE Accident_Severity_Simulated = 'Fatal'
GROUP BY Weather_Condition_Simulated, Road_Type_Simulated, Accident_Severity_Simulated
ORDER BY Total_Cases DESC;
SELECT Year,COUNT(Accident_ID) AS Total_Accidents,SUM(Persons_Killed_Simulated) AS Total_Deaths,
SUM(Persons_Injured_Simulated) AS Total_Injured
FROM Urban_Traffic_Accident_Cleaned GROUP BY Year ORDER BY Year ASC;
SELECT Vehicle_Type_Simulated,COUNT(*) AS Total_Accidents,SUM(Persons_Killed_Simulated) AS Total_Deaths,
ROUND(AVG(CAST(Vehicles_Involved_Simulated AS FLOAT)), 2) AS Avg_Vehicles_Involved
FROM Urban_Traffic_Accident_Cleaned GROUP BY Vehicle_Type_Simulated ORDER BY Total_Deaths DESC;
SELECT Day_of_Week,COUNT(*) AS Total_Accidents,SUM(Persons_Killed_Simulated) AS Total_Deaths
FROM Urban_Traffic_Accident_Cleaned GROUP BY Day_of_Week ORDER BY Total_Accidents DESC;
SELECT TOP 5 Hour,COUNT(*) AS Accident_Count,SUM(Persons_Killed_Simulated) AS Fatalities
FROM Urban_Traffic_Accident_Cleaned GROUP BY Hour ORDER BY Fatalities DESC;
SELECT Junction_Type_Simulated,Light_Condition_Simulated,COUNT(*) AS Total_Accidents
FROM Urban_Traffic_Accident_Cleaned WHERE Accident_Severity_Simulated = 'Fatal'
GROUP BY Junction_Type_Simulated, Light_Condition_Simulated ORDER BY Total_Accidents DESC;