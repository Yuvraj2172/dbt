SELECT 
    customer_id,
    customer_name,
    email,
    region,
    signup_date
FROM {{source('ecommerce', 'raw_customers')}}