# Intermediate Analysis Queries – Sakila Database

This folder contains intermediate SQL queries using the [Sakila Sample Database](https://dev.mysql.com/doc/index-other.html).  
The goal is to demonstrate proficiency with SQL aggregations

---

## Queries

### 1. Breakdown by Film Category
**Business Question:** What film categories get rented the most? How much do they profit for and what's the average number of days they are rented for?  

**Approach:**
- Joined the rental, inventory, and film_list tables
- Counted total rentals per film category
- Found the average length of each rental per movie category and rounded it to two decimal places
- Found total revenue by totaling the price of the rental
- Found average rental price per category
- Sorted results in descending order by revenue

**Results:**

- The Sports category had the most rentals and most profit
- Just because a category had a lot of rentals does not mean it was the generated the most revenue
- Average length of rental is pretty consistent across all categories, ranging from 4.6 days to 5.35 days

**SQL Query:**
```sql
SELECT f.category, 
COUNT(r.rental_id) AS Number_of_Rentals, 
SUM(f.price) AS Total_Revenue,
ROUND(AVG(f.price),2) AS Average_Rental_Price,
ROUND(AVG(DATEDIFF(r.return_date, r.rental_date)),2) AS Average_Rental_Length
FROM rental r
JOIN inventory i ON r.rental_id = i.inventory_id
JOIN film_list f ON i.film_id = f.fid
GROUP BY f.category
ORDER BY SUM(f.price) DESC
```

### 2. Breakdown by Renter Category
**Business Question:** What customers are high renters vs. medium renters vs. low renters?

**Approach:**
- Select customer and name and counted their total number of rentals
- Case statement to determine if they are a high, medium, or low renter based on their total number of rentals
- Joined the customer_list table based on customer_id
- Filtered out inactive customers
- Ordered by the number of rentals in descending order

**Results:**
- Majority of customers are deemed medium renters
- Very few people above 35 rentals
- None of the low renters have rented less than 10 times

**SQL Query:**
```sql
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
```






