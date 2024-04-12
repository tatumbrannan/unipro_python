WITH raw_data AS (
    SELECT
        *
    FROM
        {{ source('snowflake_s3','gtin_dimension') }}
)

SELECT 
    EDW_UPDATE_TIMESTAMP                    as EDW_UPDATE_TIMESTAMP,
    trim(GTIN_DESCRIPTION, ' \r\f\t\n')     as GTIN_DESCRIPTION,
    GTIN_KEY                                as GTIN_KEY,
    trim(GTIN, ' \r\f\t\n')                 as GTIN
FROM
    raw_data