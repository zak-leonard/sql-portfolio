# Basic Analysis Queries – Sakila Database

This folder contains introductory SQL queries using the [Sakila Sample Database](https://dev.mysql.com/doc/index-other.html).  
The goal is to demonstrate proficiency with basic SQL commands such as `SELECT`, `JOIN`, `WHERE`, `GROUP BY`, and `ORDER BY`.

---

## Queries

### 1. Top 10 Most Rented Movies
**Business Question:** Which 10 movies are rented the most?  

**SQL Query:**
```sql
SELECT f.title, COUNT(r.rental_id) AS num_of_rentals
FROM rental r
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY COUNT(r.rental_id) DESC
LIMIT 10;
```

### 2. Top 10 countries with the most customers
**Business Question:** What are the top 20 countries that have the most active customers?  

**SQL Query:**
```sql
SELECT cl.country, COUNT(c.customer_id) AS CountryCount
FROM customer c
LEFT JOIN customer_list cl ON c.customer_id = cl.id
WHERE c.active = 1
GROUP BY cl.country
ORDER BY COUNT(c.customer_id) DESC
LIMIT 10;
```


### 3. Customers with most transactions
**Business Question:** Who are the customers that have rented from us over 25 times?

**SQL Query:**
```sql
SELECT p.customer_id, c.first_name, c.last_name, COUNT(p.customer_id) AS num_of_transactions, SUM(amount) AS total_spend
FROM payment p
LEFT JOIN customer c ON p.customer_id = c.customer_id
GROUP BY p.customer_id
HAVING COUNT(p.customer_id) > 25
ORDER BY SUM(amount) DESC;
```

### 4. Most Popular Movie Categories
**Business Question:** What movie categories are the most popular and how many times have they been rented?

**SQL Query:**
```sql
SELECT f.category, COUNT(r.rental_id)
FROM rental r
LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN film_list f ON i.film_id = f.fid
GROUP BY f.category
ORDER BY count(r.rental_id) DESC
```
