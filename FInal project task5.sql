SELECT * FROM siri.`walmartsales dataset - walmartsales`;
WITH PaymentCounts AS (
    SELECT 
        city,
        payment,
        COUNT(payment) AS payment_count,
        dense_rank() OVER (PARTITION BY city ORDER BY COUNT(Payment) DESC) AS dr
    FROM siri.`walmartsales dataset - walmartsales`
    GROUP BY city, payment
)
SELECT city, payment, payment_count
FROM PaymentCounts
WHERE dr = 1;