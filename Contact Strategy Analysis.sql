-- Contact Strategy Analysis
SELECT 
    contact,
    CASE 
        WHEN campaign = 1 THEN 'First Contact'
        WHEN campaign BETWEEN 2 AND 3 THEN '2-3 Contacts'
        WHEN campaign BETWEEN 4 AND 5 THEN '4-5 Contacts'
        ELSE 'More than 5 Contacts'
    END as contact_attempts,
    COUNT(*) as total_customers,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) as subscriptions,
    ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as success_rate,
    ROUND(AVG(duration)/60, 2) as avg_call_duration_minutes
FROM allbank
GROUP BY 
    contact,
    CASE 
        WHEN campaign = 1 THEN 'First Contact'
        WHEN campaign BETWEEN 2 AND 3 THEN '2-3 Contacts'
        WHEN campaign BETWEEN 4 AND 5 THEN '4-5 Contacts'
        ELSE 'More than 5 Contacts'
    END
ORDER BY contact, success_rate DESC;