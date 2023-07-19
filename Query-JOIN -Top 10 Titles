### Joining tables together to find the top 10 movie titles by revenue
SELECT title, 
SUM(amount) AS total_payment
FROM payment A
INNER JOIN rental B ON A.rental_id = B.rental_id
INNER JOIN inventory C ON B.inventory_id = C.inventory_id
INNER JOIN film D ON C.film_id = D.film_id
GROUP BY title
ORDER BY total_payment DESC	
LIMIT 10
