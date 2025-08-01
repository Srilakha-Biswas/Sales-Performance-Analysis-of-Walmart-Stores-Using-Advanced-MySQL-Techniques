SELECT 
    *
FROM
    siri.`walmartsales dataset - walmartsales`;
SELECT 
    DAYNAME(STR_TO_DATE(date, '%d-%m-%Y')) AS day_of_week,
    ROUND(SUM(Total), 0) AS total_sales
FROM
    siri.`walmartsales dataset - walmartsales`
GROUP BY day_of_week
ORDER BY total_sales DESC;
