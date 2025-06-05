-- Cleaning order date and payment mode fields.
CREATE TABLE orders AS
SELECT
    order_id,
    customer_name,
    restaurant_id,
    TO_TIMESTAMP(REPLACE(order_date, '-', '/'), 'DD/MM/YYYY HH24:MI') AS order_date,
    quantity_of_items,
    order_amount,
    TRIM(LOWER(payment_mode)) AS payment_mode,
    delivery_time_mins,
    NULLIF(TRIM(customer_rating_food::TEXT), '')::INT AS customer_rating_food,
    NULLIF(TRIM(customer_rating_delivery::TEXT), '')::INT AS customer_rating_delivery
FROM dirty_orders;