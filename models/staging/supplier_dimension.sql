WITH raw_data AS (
    SELECT
        *
    FROM
        {{ source('snowflake_s3','supplier_dimension') }}
)

SELECT 
    trim(APPROVED_RECORD_FLAG, ' \r\f\t\n')     as APPROVED_RECORD_FLAG,
    EDW_CREATE_TIMESTAMP                        as EDW_CREATE_TIMESTAMP,
    EDW_UPDATE_TIMESTAMP                        as EDW_UPDATE_TIMESTAMP,
    trim(INCOME_IND, ' \r\f\t\n')               as INCOME_IND,
    trim(STATUS, ' \r\f\t\n')                   as STATUS,
    trim(SUPPADDR1, ' \r\f\t\n')                as SUPP_ADDR_1,
    trim(SUPPADDR2, ' \r\f\t\n')                as SUPP_ADDR_2,
    trim(SUPPCITY, ' \r\f\t\n')                 as SUPP_CITY,
    SUPP_KEY                                    as SUPP_KEY,
    trim(SUPPNAME, ' \r\f\t\n')                 as SUPP_NAME,
    trim(SUPPNBRNAME, ' \r\f\t\n')              as SUPP_NBR_NAME,
    SUPPNBR                                     as SUPP_NBR,
    trim(SUPPPOBOXNBR, ' \r\f\t\n')             as SUPP_POBOX_NBR,
    trim(SUPPSTATE, ' \r\f\t\n')                as SUPP_STATE,
    trim(SUPPZIP, ' \r\f\t\n')                  as SUPP_ZIP
FROM
    raw_data