# Intermediate Analysis Queries – Sakila Database

This folder contains intermediate SQL queries using the [Sakila Sample Database](https://dev.mysql.com/doc/index-other.html).  
The goal is to demonstrate proficiency with SQL aggregations

---

## Queries

### 1. Breakdown by Film Category
**Business Question:** What film categories get rented the most? How much do they profit for and what's the average number of days they are rented for?  

**SQL Query:**
```sql
SELECT f.category, COUNT(r.rental_id) AS Number_of_Rentals,
ROUND(AVG(DATEDIFF(r.return_date, r.rental_date)),2) AS Average_Rental_Length,
SUM(f.price) AS Total_Revenue
FROM rental r
JOIN inventory i ON r.rental_id = i.inventory_id
JOIN film_list f ON i.film_id = f.fid
GROUP BY f.category
ORDER BY SUM(f.price) DESC
```



