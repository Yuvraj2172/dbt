{% snapshot customers_snapshot_check %}
{{
    config(
        target_schema = 'snapshots',
        unique_key = 'customer_id',
        strategy = 'check',
        check_cols = ['region', 'email']
    )
}}

SELECT * FROM {{source('ecommerce', 'raw_customers')}}

{% endsnapshot %}