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
    _loaded_at,
    {{is_order_cancelled('status')}} as is_cancelled,
    {{ dbt_utils.generate_surrogate_key(['order_id', 'customer_id']) }} as surrogate_key
FROM {{ ref('stg_ecommerce__orders') }}
{% if is_incremental()%}
WHERE _loaded_at > (SELECT max(_loaded_at) FROM {{ this }}) - interval '3 days'
{% endif %}