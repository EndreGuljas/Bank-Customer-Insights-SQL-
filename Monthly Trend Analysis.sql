-- Monthly Trend Analysis
SELECT 
    month,
    COUNT(*) as total_contacts,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) as subscriptions,
    ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as success_rate
FROM allbank
GROUP BY month
ORDER BY 
    CASE month
        WHEN 'mar' THEN 1
        WHEN 'apr' THEN 2
        WHEN 'may' THEN 3
        WHEN 'jun' THEN 4
        WHEN 'jul' THEN 5
        WHEN 'aug' THEN 6
        WHEN 'sep' THEN 7
        WHEN 'oct' THEN 8
        WHEN 'nov' THEN 9
        WHEN 'dec' THEN 10
        WHEN 'jan' THEN 11
        WHEN 'feb' THEN 12
    END;