-- macros/log_results.sql
{% macro log_results(results) %}
    {% for result in results %}
        {% do log("Model: " ~ result.node.name ~ " Status: " ~ result.status, info=True) %}
    {% endfor %}
{% endmacro %}
