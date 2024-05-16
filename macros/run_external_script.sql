{% macro run_external_script(script_path) %}
    {%- if execute -%}
        {{ log("Running external script: " ~ script_path, info=True) }}
        {% do run_query("!sh " ~ script_path) %}
    {%- endif -%}
{% endmacro %}
