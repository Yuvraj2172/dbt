{{config(store_failures = true)}}

SELECT 
    order_id,
    customer_id,
    amount,
    'negative amount found' as failure_reason
FROM {{ ref('fct_orders')}}
WHERE amount < 0