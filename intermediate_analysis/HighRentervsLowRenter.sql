SELECT c.name, COUNT(r.rental_id) AS Number_of_Rentals, 
CASE 
	WHEN COUNT(r.rental_id) >= 30 THEN 'High renter'
    WHEN COUNT(r.rental_id) >= 20 THEN 'Medium renter'
    ELSE 'Low renter'
    END AS RenterStatus
FROM rental r
JOIN customer_list c ON r.customer_id = c.id
WHERE c.notes = "active"
GROUP BY c.id
ORDER BY COUNT(r.rental_id) DESC