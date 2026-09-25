# dbt_learning

A dbt learning project modeling ecommerce order/customer data, built end-to-end on
Postgres: sources -> staging -> fact/dimension marts, with tests, docs, an
incremental model, snapshots, and a real dbt package.

### Project structure

- `models/staging/` — `stg_ecommerce__orders`, `stg_ecommerce__customers`, plus
  `sources.yml` declaring the `ecommerce` source (`raw.raw_orders`, `raw.raw_customers`).
- `models/marts/` — `fct_orders` (incremental fact table), `dim_customers`,
  `customer_order_summary` (rollup), `order_status_breakdown` (macro demo).
- `snapshots/` — SCD Type 2 history of `raw_customers`, one using the `timestamp`
  strategy, one using `check`.
- `macros/` — `is_order_cancelled`, `order_status_breakdown` (a `for`-loop macro demo).
- `tests/` — `assert_orders_amount_not_negative`, a singular test with `store_failures`.
- `ci/` — Postgres profile and raw-data seed script used by CI.
- `.github/workflows/dbt_ci.yml` — runs `dbt build` against a throwaway Postgres
  container on every PR into `main`.

### Running locally

```bash
source .venv/bin/activate
dbt deps
dbt build
```

Requires a `~/.dbt/profiles.yml` pointing at a local Postgres database (see
`ci/profiles.yml` for the shape; local dev uses your own credentials, not the
throwaway CI ones).

### Resources

- [dbt docs](https://docs.getdbt.com/docs/introduction)
- [dbt Discourse](https://discourse.getdbt.com/)
