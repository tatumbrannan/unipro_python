
{% macro log_errors(results) %}
    {% do log("Starting error logging macro", info=True) %}
    {% if var('error_logging_enabled', true) %}
        {% do log("Error logging is enabled", info=True) %}
        {% for result in results %}
            {% do log("Processing result with status: " ~ result.status, info=True) %}
            {% if result.status == 'error' %}
                {% do log("Logging error: " ~ result.message, info=True) %}
                {% set sql %}
                    insert into snowflake_101.dbt_tbrannan.error_log (error_timestamp, run_started_at, invocation_id, error_message)
                    values (
                        current_timestamp,
                        '{{ run_started_at }}',
                        '{{ invocation_id }}',
                        '{{ result.message }}'
                    )
                {% endset %}
                {% do log("Executing SQL: " ~ sql, info=True) %}
                {{ run_query(sql) }}
                {% do log("SQL executed successfully", info=True) %}
            {% endif %}
        {% endfor %}
    {% endif %}
    {% do log("Completed error logging macro", info=True) %}
{% endmacro %}
