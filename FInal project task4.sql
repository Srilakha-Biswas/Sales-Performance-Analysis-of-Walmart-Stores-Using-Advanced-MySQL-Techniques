SELECT * FROM siri.`walmartsales dataset - walmartsales`;
WITH ProductLineStats AS (
    SELECT 
        `Product line` AS Product_Line,
        AVG(`Total`) AS Avg_Sales,
        STDDEV(`Total`) AS StdDev_Sales
    FROM 
       siri.`walmartsales dataset - walmartsales`
    GROUP BY 
        `Product line`
),
Anomalies AS (
    SELECT 
        ws.`Invoice ID` AS Transaction_ID,
        ws.`Product line` AS Product_Line,
        ws.`Total` AS Sales,
        pls.Avg_Sales,
        pls.StdDev_Sales,
        CASE 
            WHEN ws.`Total` > pls.Avg_Sales + 2 * pls.StdDev_Sales THEN 'High Anomaly'
            ELSE 'Low Anomaly'
        END AS Anomaly_Type
    FROM 
        siri.`walmartsales dataset - walmartsales` ws
    JOIN 
        ProductLineStats pls
    ON 
        ws.`Product line` = pls.Product_Line
)
SELECT 
    Transaction_ID,
    Product_Line,
    Sales,
    Avg_Sales,
    StdDev_Sales,
    Anomaly_Type
FROM 
    Anomalies
ORDER BY 
    Product_Line, Anomaly_Type;

