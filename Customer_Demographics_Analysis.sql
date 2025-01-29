-- Customer Demographics Analysis
WITH age_groups AS (
SELECT 
	CASE 
		WHEN age < 20 THEN 'Age under 20'
		WHEN age BETWEEN 20 AND 30 THEN 'Age between 20-30'
		WHEN age BETWEEN 31 AND 40 THEN 'Age between 31-40'
		WHEN age BETWEEN 41 AND 50 THEN 'Age between 41-50'
		WHEN age BETWEEN 51 AND 60 THEN 'Age between 51-60'
		ELSE 'Age over 60'
	END AS age_group, y as subscription, COUNT(*) as customer_count
    FROM allbank
        GROUP BY 
        CASE 
            WHEN age < 20 THEN 'Age under 20'
			WHEN age BETWEEN 20 AND 30 THEN 'Age between 20-30'
			WHEN age BETWEEN 31 AND 40 THEN 'Age between 31-40'
			WHEN age BETWEEN 41 AND 50 THEN 'Age between 41-50'
			WHEN age BETWEEN 51 AND 60 THEN 'Age between 51-60'
			ELSE 'Age over 60'
        END, y)
        
SELECT 
    age_group,
    SUM(CASE WHEN subscription = 'yes' THEN customer_count ELSE 0 END) as subscribed,
    SUM(CASE WHEN subscription = 'no' THEN customer_count ELSE 0 END) as not_subscribed,
    ROUND(SUM(CASE WHEN subscription = 'yes' THEN customer_count ELSE 0 END) * 100.0 / SUM(customer_count), 2) as subscription_rate
FROM age_groups
GROUP BY age_group
ORDER BY age_group;