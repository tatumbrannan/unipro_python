
{% macro hello_world() %}

    from dbt.exceptions import RuntimeException
    import pandas as pd
    import snowflake.connector

    def model(dbt, session):
        # Create a DataFrame with a single row containing "Hello, world!"
        df = pd.DataFrame({"Message": ["Hello, world!"]})
        return df
     raise RuntimeException("Something went wrong!")
{% endmacro %}