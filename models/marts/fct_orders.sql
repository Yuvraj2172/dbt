{{ config(
    materialized = 'incremental',
    unique_key = 'order_id'
)}}
SELECT 
    order_id,
    customer_id,
    order_date,
    status,
    amount,
    {{is_order_cancelled('status')}} as is_cancelled
FROM {{ ref('stg_ecommerce__orders') }}
{% if is_incremental()%}
WHERE order_date > (SELECT max(order_date) FROM {{ this }})
{% endif %}