WITH top_customers_cte (customer_id, first_name, last_name, country, city, total_amount_pad) AS
(SELECT A.customer_id,
A.first_name,
A.last_name,
D.country,
C.city,
SUM(amount) AS total_amount_paid
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
INNER JOIN payment E ON A.customer_id = E.customer_id
WHERE city IN ('Aurora', 'Acua', 'Citrus Heights', 'Iwaki', 'Ambattur', 'Shanwei', 'So Leopold', 'Teboksary', 'Tianjin', 'Cianjur')
GROUP BY A.customer_id, D.country, city
ORDER BY total_amount_paid DESC
LIMIT 5)
SELECT D.country, COUNT(A.customer_id) AS all_customer_count, COUNT(top_customers_cte.customer_id) AS top_customer_count
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
LEFT JOIN top_customers_cte ON A.customer_id = top_customers_cte.customer_id
GROUP BY D.country
HAVING COUNT (top_customers_cte) > 0
ORDER BY all_customer_count DESC
