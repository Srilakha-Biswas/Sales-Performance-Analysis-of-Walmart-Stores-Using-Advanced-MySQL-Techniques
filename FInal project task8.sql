SELECT * FROM siri.`walmartsales dataset - walmartsales`;
SELECT 
    w1.`Customer ID`,
    w1.`Date` AS FirstPurchaseDate,
    w2.`Date` AS RepeatPurchaseDate,
    DATEDIFF(STR_TO_DATE(w2.`Date`, '%d-%m-%Y'), STR_TO_DATE(w1.`Date`, '%d-%m-%Y')) AS DaysBetweenPurchases
FROM siri.`walmartsales dataset - walmartsales` w1
JOIN siri.`walmartsales dataset - walmartsales` w2 
    ON w1.`Customer ID` = w2.`Customer ID` 
    AND STR_TO_DATE(w1.`Date`, '%d-%m-%Y') < STR_TO_DATE(w2.`Date`, '%d-%m-%Y') 
    AND DATEDIFF(STR_TO_DATE(w2.`Date`, '%d-%m-%Y'), STR_TO_DATE(w1.`Date`, '%d-%m-%Y')) <=30;