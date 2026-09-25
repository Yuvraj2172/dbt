-- Simulates the upstream ingestion pipeline landing raw data,
-- since raw.raw_orders / raw.raw_customers are not built by dbt
-- and don't exist in a fresh CI database otherwise.

CREATE SCHEMA IF NOT EXISTS raw;

CREATE TABLE raw.raw_orders (
    order_id integer,
    customer_id integer,
    order_date date,
    status text,
    amount numeric,
    _loaded_at timestamp default now()
);

INSERT INTO raw.raw_orders (order_id, customer_id, order_date, status, amount) VALUES
(1, 101, '2026-01-05', 'completed', 250.00),
(2, 101, '2026-01-12', 'completed', 89.50),
(3, 102, '2026-01-15', 'completed', 430.00),
(4, 103, '2026-01-18', 'cancelled', 120.00),
(5, 102, '2026-01-20', 'completed', 75.25),
(6, 104, '2026-01-22', 'completed', 300.00),
(7, 101, '2026-01-25', 'returned', 60.00),
(8, 103, '2026-01-28', 'completed', 215.75),
(9, 104, '2026-02-02', 'completed', 45.00),
(10, 102, '2026-02-05', 'completed', 180.00);

CREATE TABLE raw.raw_customers (
    customer_id integer,
    customer_name text,
    email text,
    region text,
    signup_date date,
    _loaded_at timestamp default now(),
    updated_at timestamp default now()
);

INSERT INTO raw.raw_customers (customer_id, customer_name, email, region, signup_date) VALUES
(101, 'Asha Rao', 'asha.rao@example.com', 'North', '2025-11-01'),
(102, 'Wei Chen', 'wei.chen@example.com', 'East', '2025-11-15'),
(103, 'Maria Lopez', 'maria.lopez@example.com', 'South', '2025-12-02'),
(104, 'Tom Baker', 'tom.baker@example.com', 'West', '2025-12-20');
