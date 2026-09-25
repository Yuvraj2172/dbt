SELECT 
    order_id, 
    customer_id,
    order_date,
    status,
    amount
FROM {{ ref('raw_orders')}}
where status != 'cancelled'