WITH raw_data AS (
    SELECT
        *
    FROM
        {{ source('snowflake_s3','department_dimension') }}
)

SELECT 
    trim(APPROVED_RECORD_FLAG, ' \r\f\t\n')    as APPROVED_RECORD_FLAG,
    trim(DEPTCODE, ' \r\f\t\n')                as DEPT_CODE,
    DEPTKEY                                    as DEPT_KEY,
    trim(DEPTNAME, ' \r\f\t\n')                as DEPT_NAME,
    EDW_CREATE_TIMESTAMP                       as EDW_CREATE_TIMESTAMP,
    EDW_UPDATE_TIMESTAMP                       as EDW_UPDATE_TIMESTAMP,
    trim(TS_DEPT, ' \r\f\t\n')                 as TS_DEPT
FROM
    raw_data