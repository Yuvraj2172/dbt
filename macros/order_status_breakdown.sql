{% macro order_status_breakdown() %}
    {% set statuses = ['completed', 'cancelled', 'returned'] %}
    {% for status in statuses %}
    sum(case when status = '{{status}}' then amount else 0 end ) as {{ status }}_amount{{"," if not loop.last }}
    {% endfor %}
{% endmacro %}