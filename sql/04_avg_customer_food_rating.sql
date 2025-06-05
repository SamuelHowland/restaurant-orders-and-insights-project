-- Q2a. Is there a relationship between customer food ratings and how well a restaurant sales perform?

-- Ranks each restaurants average customer rating from highest to lowest, with total sales generated.

SELECT
	r.restaurant_name,
	ROUND(AVG(o.customer_rating_food), 2) AS avg_customer_rating,
	SUM(o.order_amount) AS total_sales,
	RANK() OVER (
		ORDER BY AVG(o.customer_rating_food) DESC) ranked_by_customer_rating
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
;