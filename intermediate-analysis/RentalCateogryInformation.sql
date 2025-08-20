SELECT f.category, COUNT(r.rental_id) AS Number_of_Rentals, ROUND(AVG(DATEDIFF(r.return_date, r.rental_date)),2) AS Average_Rental_Length, SUM(f.price) AS Total_Revenue
FROM rental r
JOIN inventory i ON r.rental_id = i.inventory_id
JOIN film_list f ON i.film_id = f.fid
GROUP BY f.category
ORDER BY SUM(f.price) DESC