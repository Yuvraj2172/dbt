SELECT
    {{ order_status_breakdown() }}
FROM {{ ref('fct_orders') }}
