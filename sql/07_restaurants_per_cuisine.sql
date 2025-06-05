- Q4b. Are there any patterns between cuisines and the total number of representing restaurants?  

-- Counts each restaurant per cuisine and total orders placed, compared against the average order amount.

SELECT
	r.cuisine,
	COUNT(DISTINCT(r.restaurant_id)) AS total_restaurants,
	COUNT(o.order_id) AS total_orders,
	ROUND(AVG(order_amount), 2) AS avg_order_amount
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id 
GROUP BY cuisine
ORDER BY total_restaurants ASC