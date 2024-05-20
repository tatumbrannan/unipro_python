import snowflake.connector


def model(dbt, session):
    cursor = session.connection.cursor()
    cursor.execute("SELECT * FROM snowflake_101.dbt_tbrannan.lt_access_history")
    df = cursor.fetch_pandas_all()
    cursor.close()
    return df

