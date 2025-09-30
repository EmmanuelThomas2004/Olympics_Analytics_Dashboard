 1️⃣ Total Medals Over Years
SELECT Year, COUNT(*) AS TotalMedalsFROM sportsdb.AthletesWHERE MedalWon = 'Yes'GROUP BY YearORDER BY Year ASC;

2️⃣ Top 10 Countries by Total Medals
SELECT NOC AS Country, COUNT(*) AS TotalMedalsFROM sportsdb.AthletesWHERE MedalWon = 'Yes'GROUP BY NOCORDER BY TotalMedals DESCLIMIT 10;

 3️⃣ Percentage of Athletes With Medals
SELECT COUNT(*) AS TotalAthletes,SUM(CASE WHEN MedalWon='Yes' THEN 1 ELSE 0 END) AS AthletesWithMedals,ROUND(SUM(CASE WHEN MedalWon='Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS PercentWithMedals
FROM sportsdb.Athletes;

 4️⃣ Average Height & Weight by Age Group
SELECT CASE
        WHEN Age < 20 THEN 'Under 20'
        WHEN Age BETWEEN 20 AND 24 THEN '20-24'
        WHEN Age BETWEEN 25 AND 29 THEN '25-29'
        ELSE '30+'
  END AS AgeGroup,
    AVG(Height) AS AvgHeight,
    AVG(Weight) AS AvgWeight
FROM sportsdb.AthletesGROUP BY AgeGroupORDER BY AgeGroup;

 5️⃣ Top 5 Sports by Avg Height
SELECT Sport, AVG(Height) AS AvgHeightFROM sportsdb.AthletesGROUP BY SportORDER BY AvgHeight DESCLIMIT 5;

 6️⃣ Medals by Age Group
SELECT 
    CASE
        WHEN Age < 20 THEN 'Under 20'
        WHEN Age BETWEEN 20 AND 24 THEN '20-24'
        WHEN Age BETWEEN 25 AND 29 THEN '25-29'
        ELSE '30+'
    END AS AgeGroup,
    COUNT(*) AS TotalMedals
FROM sportsdb.AthletesWHERE MedalWon='Yes'GROUP BY AgeGroupORDER BY AgeGroup;

7️⃣ Top 4 Sports by Medal Count
SELECT Sport, COUNT(*) AS TotalMedalsFROM sportsdb.AthletesWHERE MedalWon='Yes'GROUP BY SportORDER BY TotalMedals DESCLIMIT 4;
