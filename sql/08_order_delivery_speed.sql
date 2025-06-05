-- Q5a. Does the speed of delivery have any impact on customer food ratings?

-- 3 delivery speed buckets have been created ranged between 10 minutes, the lowest delivery speed time, and 50 minutes, the highest delivery speed time, with each delivery speeds average food rating.

-- Step 1: Create 3 speed buckets based on quick, medium, and slow delivery time measurements
WITH delivery_speed_buckets AS (
	SELECT
		o.order_id,
		CASE
			WHEN delivery_time_mins BETWEEN 10 AND 23 THEN '10-23 minutes'
			WHEN delivery_time_mins BETWEEN 24 AND 37 THEN '24-37 minutes'
			ELSE '38-50 minutes'
		END AS delivery_speed_category
	FROM orders o 
),

-- Step 2: Add average food quality with each speed bucket.
avg_rating_by_speed AS (
	SELECT 
		dsp.delivery_speed_category,
		ROUND(AVG(o.customer_rating_food), 2) AS avg_food_rating
	FROM delivery_speed_buckets dsp
	JOIN orders o ON dsp.order_id = o.order_id 
	GROUP BY dsp.delivery_speed_category
)

-- Final output: ordered by delivery speed from fastest to slowest
SELECT *
FROM avg_rating_by_speed
ORDER BY CASE delivery_speed_category
	WHEN '10-23 minutes' THEN 1
	WHEN '24-37 minutes' THEN 2
	WHEN '38-50 minutes' THEN 3
END;