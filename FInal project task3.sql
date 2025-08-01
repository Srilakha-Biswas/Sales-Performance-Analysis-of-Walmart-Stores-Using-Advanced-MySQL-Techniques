SELECT * FROM siri.`walmartsales dataset - walmartsales`;
WITH Customer_Spending AS (
    SELECT
        `Customer ID`,
        SUM(Total) AS TotalSpending
    FROM
       siri.`walmartsales dataset - walmartsales`
    GROUP BY
        `Customer ID`
),
SpendingStats AS (
    SELECT
        AVG(TotalSpending) AS AverageSpending,
        STDDEV(TotalSpending) AS SpendingStdDev
    FROM
        Customer_Spending
)
SELECT
    cs.`Customer ID`,
    cs.TotalSpending,
    CASE
        WHEN cs.TotalSpending > (ss.AverageSpending + ss.SpendingStdDev) THEN 'High Spender'
        WHEN cs.TotalSpending < (ss.AverageSpending - ss.SpendingStdDev) THEN 'Low Spender'
        ELSE 'Medium Spender'
    END AS SpendingTier
FROM
    Customer_Spending cs,
    SpendingStats ss;