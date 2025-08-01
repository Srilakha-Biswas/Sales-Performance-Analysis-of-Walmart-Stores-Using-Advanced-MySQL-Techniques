SELECT * FROM siri.`walmartsales dataset - walmartsales`;
WITH CustomerSales AS (
    SELECT 
        `Customer ID`,
        SUM(`Total`) AS Total_Sales
    FROM 
        siri.`walmartsales dataset - walmartsales`
        
    GROUP BY 
        `Customer ID`
),
RankedCustomers AS (
    SELECT 
        `Customer ID`,
        Total_Sales,
        RANK() OVER (ORDER BY Total_Sales DESC) AS Sales_Rank
    FROM 
        CustomerSales
)
SELECT 
    `Customer ID`,
    Total_Sales,
    Sales_Rank
FROM 
    RankedCustomers
WHERE 
    Sales_Rank <= 5
ORDER BY 
    Sales_Rank;
