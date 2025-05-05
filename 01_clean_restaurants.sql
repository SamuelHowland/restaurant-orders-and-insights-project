-- Cleaning restaurant_name and cuisine fields
CREATE TABLE restaurants AS 
SELECT 
	restaurant_id,
	TRIM(restaurant_name) AS restaurant_name,
	INITCAP(cuisine) AS cuisine,
	zone,
	category
FROM dirty_restaurants dr