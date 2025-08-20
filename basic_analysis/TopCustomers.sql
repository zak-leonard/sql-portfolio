SELECT p.customer_id, c.first_name, c.last_name, COUNT(p.customer_id) AS num_of_transactions, SUM(amount) AS total_spend
FROM payment p
LEFT JOIN customer c ON p.customer_id = c.customer_id
GROUP BY p.customer_id
HAVING COUNT(p.customer_id) > 25
ORDER BY SUM(amount) DESC;