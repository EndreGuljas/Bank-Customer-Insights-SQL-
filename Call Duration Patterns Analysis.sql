-- Call Duration Patterns Analysis
SELECT 
    CASE 
        WHEN duration <= 60 THEN 'Very Short (≤1min)'
        WHEN duration <= 180 THEN 'Short (1-3min)'
        WHEN duration <= 360 THEN 'Medium (3-6min)'
        WHEN duration <= 600 THEN 'Long (6-10min)'
        ELSE 'Very Long (>10min)'
    END as call_duration_category,
    COUNT(*) as total_calls,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) as subscriptions,
    ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as success_rate
FROM allbank
GROUP BY call_duration_category
ORDER BY 
    CASE call_duration_category
        WHEN 'Very Short (≤1min)' THEN 1
        WHEN 'Short (1-3min)' THEN 2
        WHEN 'Medium (3-6min)' THEN 3
        WHEN 'Long (6-10min)' THEN 4
        WHEN 'Very Long (>10min)' THEN 5
    END;