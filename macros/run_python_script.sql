{% macro run_python_script() %}
    {{
        run_operation(
            python_script=ref('end_script.py'),
            python_version=3,
            environment={'unipro_python': var('unipro_python')}
        )
    }}
{% endmacro %}
