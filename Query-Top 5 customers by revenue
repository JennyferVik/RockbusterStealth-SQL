### Joining tables to find top 5 customers by revenue
SELECT A.customer_id, 
A.first_name,
A.last_name,
D.country,
C.city,
SUM(amount) AS amount_paid
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id
GROUP BY A.customer_id, country, city
ORDER BY amount_paid DESC
LIMIT 5
