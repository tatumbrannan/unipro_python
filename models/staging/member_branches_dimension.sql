WITH raw_data AS (
    SELECT
        *
    FROM
        {{ source('snowflake_s3','member_branches_dimension') }}
)

SELECT 
    trim(APPROVED_RECORD_FLAG, ' \r\f\t\n')     as APPROVED_RECORD_FLAG,
    EDW_CREATE_TIMESTAMP                        as EDW_CREATE_TIMESTAMP,
    EDW_UPDATE_TIMESTAMP                        as EDW_UPDATE_TIMESTAMP,
    HEADQUARTERS_KEY                            as HEAD_QUARTERS_KEY,
    trim(HQFLG, ' \r\f\t\n')                    as HQFLG,
    trim(MBRNBRNAME, ' \r\f\t\n')               as MBR_NBR_NAME,
    trim(MBRPOBOX, ' \r\f\t\n')                 as MBR_POBOX,
    trim(MEMADDR1, ' \r\f\t\n')                 as MEM_ADDR_1,
    trim(MEMADDR2, ' \r\f\t\n')                 as MEM_ADDR_2,
    MEMBRCHNBR                                  as MEM_BRCH_NBR,
    trim(MEMCITY, ' \r\f\t\n')                  as MEM_CITY,
    trim(MEMNAME, ' \r\f\t\n')                  as MEM_NAME,
    MEMNBR                                      as MEM_NBR,
    trim(MEMSTATE, ' \r\f\t\n')                 as MEM_STATE,
    trim(MEMSTATUS, ' \r\f\t\n')                as MEM_STATUS,
    trim(MEMZIP, ' \r\f\t\n')                   as MEM_ZIP,
    MEMBER_KEY                                  as MEMBER_KEY,
    trim(MEMBERSHIP_TYPE_NAME, ' \r\f\t\n')     as MEMBERSHIP_TYPE_NAME
FROM
    raw_data