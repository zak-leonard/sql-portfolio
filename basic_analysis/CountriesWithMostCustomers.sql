SELECT cl.country, COUNT(c.customer_id) AS CountryCount
FROM customer c
LEFT JOIN customer_list cl ON c.customer_id = cl.id
WHERE c.active = 1
GROUP BY cl.country
ORDER BY COUNT(c.customer_id) DESC
LIMIT 10;