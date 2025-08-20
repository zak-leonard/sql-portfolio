SELECT f.category, COUNT(r.rental_id)
FROM rental r
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN film_list f ON i.film_id = f.fid
GROUP BY f.category
ORDER BY count(r.rental_id) DESC