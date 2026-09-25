SELECT
    customer_id,
    trim(customer_name) as customer_name,
    lower(trim(email)) as email,
    trim(region) as region,
    signup_date
FROM {{source('ecommerce', 'raw_customers')}}