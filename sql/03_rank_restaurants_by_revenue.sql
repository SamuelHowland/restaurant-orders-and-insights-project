-- Q1a. Which restaurants generated the most revenue, and is there a link between the number of fulfilled orders?

-- Ranks each restaurant in order of sales generated and includes number of orders fulfilled.

SELECT
	r.restaurant_name,
	COUNT(o.order_id) AS total_orders,
	SUM(o.order_amount) AS total_sales,
	RANK () OVER (
		ORDER BY SUM(o.order_amount) DESC
	) AS ranked_by_sales
FROM orders o 
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
;