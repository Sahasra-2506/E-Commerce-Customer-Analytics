WITH order_summary AS (
    SELECT
        o.customer_id,
        o.order_id,
        o.order_purchase_timestamp,
        SUM(oi.price + oi.freight_value) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY o.customer_id, o.order_id, o.order_purchase_timestamp
),
customer_agg AS (
    SELECT
        customer_id,
        MAX(order_purchase_timestamp) AS last_purchase_date,
        COUNT(order_id) AS frequency,
        SUM(order_total) AS monetary
    FROM order_summary
    GROUP BY customer_id
)
SELECT
    customer_id,
    last_purchase_date,
    frequency,
    monetary,
    JULIANDAY((SELECT MAX(order_purchase_timestamp) FROM orders)) 
        - JULIANDAY(last_purchase_date) AS recency_days
FROM customer_agg;