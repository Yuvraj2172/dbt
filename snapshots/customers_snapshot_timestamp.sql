{% snapshot customers_snapshot_timestamp %}
{{
    config(
        target_schema = 'snapshots',
        unique_key = 'customer_id',
        strategy = 'timestamp',
        updated_at = 'updated_at'
    )
}}

SELECT * FROM {{source('ecommerce', 'raw_customers')}}

{% endsnapshot %}
