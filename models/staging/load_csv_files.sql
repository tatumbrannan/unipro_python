{% macro load_csv_files(csv_folder, bucket_name) %}
{% set local_directory = csv_folder %}
{% set script_path = "python_script.py" %}

{% if execute %}
    {% set script_args = ["python", script_path] %}
    {% do run_python_script(script_args) %}
{% endif %}
{% endmacro %}
