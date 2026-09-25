
SELECT 
    order_id,
    customer_id,
    order_date,
    status,
    amount,
    {{is_order_cancelled('status')}} as is_cancelled
FROM {{ ref('stg_ecommerce__orders') }}