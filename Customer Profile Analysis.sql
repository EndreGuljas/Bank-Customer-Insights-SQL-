-- Customer Profile Analysis
SELECT 
    education, 
    job, 
    COUNT(*) as total_customers, 
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) as subscriptions, 
    ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as success_rate
FROM allbank
GROUP BY education, job
ORDER BY subscriptions DESC;