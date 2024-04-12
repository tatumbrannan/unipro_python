WITH raw_data AS (
    SELECT
        *
    FROM
        {{ source('snowflake_s3','duns_xref') }}
)

SELECT
    DUNS_BRANCH_NUMBER                  as DUNS_BRANCH_NUMBER,
    DUNS_NUMBER                         as DUNS_NUMBER,
    UNIPRO_BRANCH_NUMBER                as UNIPRO_BRANCH_NUMBER,
    UNIPRO_NUMBER                       as UNIPRO_NUMBER,
    trim(RECORD_TYPE, ' \r\f\t\n')      as RECORD_TYPE
FROM
    raw_data