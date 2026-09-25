{% macro is_order_cancelled(status_column) %}
    {{ status_column}} = 'cancelled'
{% endmacro %}