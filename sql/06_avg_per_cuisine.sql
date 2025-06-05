-- Q4a. Which cuisine types generate the highest average order values, and how do they compare against customer satisfaction?

-- Ranks cuisine in order of revenue size, with each restaurants total average food rating score.

-- Step 1: Calculate average sale per cuisine
WITH avg_cuisine_order AS (
	SELECT 
		r.cuisine,
		ROUND(AVG(o.order_amount), 2) AS avg_order_amount
	FROM restaurants r
	JOIN orders o ON r.restaurant_id = o.restaurant_id
	GROUP BY r.cuisine
),

-- Step 2: Add average food rating per cuisine
avg_cuisine_food_rating AS (
	SELECT
		aco.cuisine,
		aco.avg_order_amount,
		ROUND(AVG(o.customer_rating_food), 2) AS avg_food_rating
	FROM avg_cuisine_order aco
	JOIN restaurants r ON aco.cuisine = r.cuisine
	JOIN orders o ON r.restaurant_id = o.restaurant_id
	GROUP BY aco.cuisine, aco.avg_order_amount
),

-- Step 3: Rank cuisines by average sale
ranked AS (
	SELECT
		acfr.cuisine,
		acfr.avg_order_amount,
		acfr.avg_food_rating,
		RANK() OVER (ORDER BY acfr.avg_order_amount DESC) AS ranked_by_order_amount
	FROM avg_cuisine_food_rating acfr
)
-- Step 4: Final output
SELECT *
FROM ranked
;