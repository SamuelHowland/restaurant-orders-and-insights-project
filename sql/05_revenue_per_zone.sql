-- Q3a. How does restaurant performance differ across the four delivery zones?

-- Groups each zone with total restaurants, total sales, and the total average amount spent.

SELECT
	r.zone,
	COUNT(DISTINCT(r.restaurant_id)) AS total_restaurants,
	SUM(o.order_amount) AS total_sales,
	ROUND(AVG(o.order_amount), 2) AS avg_order_amount
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.zone
;