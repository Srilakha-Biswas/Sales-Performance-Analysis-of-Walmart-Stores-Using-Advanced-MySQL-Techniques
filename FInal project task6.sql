SELECT * FROM siri.`walmartsales dataset - walmartsales`;
SELECT Gender,
       MONTH(Date) AS Month,
       SUM(Total) AS TotalSales
FROM siri.`walmartsales dataset - walmartsales`
GROUP BY Gender, MONTH(Date)
ORDER BY Gender, Month;
