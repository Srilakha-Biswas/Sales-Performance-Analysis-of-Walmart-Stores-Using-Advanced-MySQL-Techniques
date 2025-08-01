SELECT * FROM siri.`walmartsales dataset - walmartsales`;
WITH Month_wise_Sales AS (
    SELECT 
        Branch,
        DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS Month,
        SUM(Total) AS TotalSales
    FROM siri.`walmartsales dataset - walmartsales`
    GROUP BY Branch, Month
),
GrowthRate AS (
    SELECT 
        m1.Branch,
        m1.Month,
        m1.TotalSales,
        (m1.TotalSales - m2.TotalSales) / NULLIF(m2.TotalSales, 0) * 100 AS GrowthPercentage
    FROM Month_wise_Sales m1  
    LEFT JOIN Month_wise_Sales m2 
        ON m1.Branch = m2.Branch
        AND DATE_FORMAT(DATE_SUB(STR_TO_DATE(CONCAT(m1.Month, '-01'), '%Y-%m-%d'), INTERVAL 1 MONTH), '%Y-%m') = m2.Month
)
SELECT 
    Branch,
    AVG(GrowthPercentage) AS AvgGrowthRate
FROM GrowthRate
GROUP BY Branch
ORDER BY AvgGrowthRate DESC
LIMIT 1;