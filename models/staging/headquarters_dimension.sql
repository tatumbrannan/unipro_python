WITH raw_data AS (
    SELECT
        *
    FROM
        {{ source('snowflake_s3','headquarters_dimension') }}
)

SELECT 
    trim(APPROVED_RECORD_FLAG    , ' \r\f\t\n')     as APPROVED_RECORD_FLAG,
    EDW_CREATE_TIMESTAMP                            as EDW_CREATE_TIMESTAMP,
    EDW_UPDATE_TIMESTAMP                            as EDW_UPDATE_TIMESTAMP,
    trim(HEADQUARTERSADDR1, ' \r\f\t\n')            as HEAD_QUARTERS_ADDR_1,
    trim(HEADQUARTERSADDR2, ' \r\f\t\n')            as HEAD_QUARTERS_ADDR_2,
    HEADQUARTERSBRANCH                              as HEAD_QUARTERS_BRANCH,
    trim(HEADQUARTERSCITY, ' \r\f\t\n')             as HEAD_QUARTERS_CITY,
    HEADQUARTERS_KEY                                as HEAD_QUARTERS_KEY,
    trim(HEADQUARTERSNAME, ' \r\f\t\n')             as HEAD_QUARTERS_NAME,
    HEADQUARTERSNBR                                 as HEAD_QUARTERS_NBR,
    trim(HEADQUARTERSSTATE, ' \r\f\t\n')            as HEAD_QUARTERS_STATE,
    trim(HEADQUARTERSSTATUS, ' \r\f\t\n')           as HEAD_QUARTERS_STATUS,
    trim(HEADQUARTERSZIP, ' \r\f\t\n')              as HEAD_QUARTERS_ZIP,
    trim(HQNBRNAME, ' \r\f\t\n')                    as HQNBR_NAME
FROM
    raw_data