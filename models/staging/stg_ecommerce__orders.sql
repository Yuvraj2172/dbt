SELECT
    order_id,
    customer_id,
    order_date,
    status,
    amount,
    _loaded_at
FROM {{ source('ecommerce', 'raw_orders') }}