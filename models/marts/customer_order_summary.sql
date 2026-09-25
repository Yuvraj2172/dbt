SELECT 
    customer_id,
    count(order_id) as total_orders,
    sum(amount) as total_spent,
    round(avg(amount)::numeric, 2) as avg_order_value,
    max(order_date) as last_order_date
FROM {{ref('stg_orders')}}
group by customer_id
order by total_spent desc