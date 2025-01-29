-- Balance Range Analysis
SELECT 
    CASE 
        WHEN balance < 0 THEN 'Negative Balance'
        WHEN balance = 0 THEN 'Zero Balance'
        WHEN balance BETWEEN 1 AND 1000 THEN '1-1,000'
        WHEN balance BETWEEN 1001 AND 5000 THEN '1,001-5,000'
        WHEN balance BETWEEN 5001 AND 10000 THEN '5,001-10,000'
        ELSE 'Over 10,000'
    END as balance_category,
    COUNT(*) as customer_count,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) as subscriptions,
    ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as success_rate
FROM allbank
GROUP BY 
    CASE 
        WHEN balance < 0 THEN 'Negative Balance'
        WHEN balance = 0 THEN 'Zero Balance'
        WHEN balance BETWEEN 1 AND 1000 THEN '1-1,000'
        WHEN balance BETWEEN 1001 AND 5000 THEN '1,001-5,000'
        WHEN balance BETWEEN 5001 AND 10000 THEN '5,001-10,000'
        ELSE 'Over 10,000'
    END
ORDER BY success_rate DESC;