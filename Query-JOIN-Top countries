### Joining tables to find the top countries by revenue and count.
SELECT country, 
COUNT(DISTINCT A.customer_id) AS customer_count,
SUM(amount) AS total_payment
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id
GROUP BY country
ORDER BY total_payment DESC
