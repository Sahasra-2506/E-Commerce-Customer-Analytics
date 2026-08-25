SELECT
    o.order_id,
    o.customer_id,
    o.order_purchase_timestamp,
    SUM(oi.price + oi.freight_value) AS order_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY o.order_id, o.customer_id, o.order_purchase_timestamp;