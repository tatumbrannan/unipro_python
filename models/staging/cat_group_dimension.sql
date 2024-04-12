WITH raw_data AS (
    SELECT
        *
    FROM
        {{ source('snowflake_s3','cat_group_dimension') }}
)

SELECT 
    trim(APPROVED_RECORD_FLAG, ' \r\f\t\n')     as APPROVED_RECORD_FLAG,
    trim(CATCATEGORYNAME, ' \r\f\t\n')          as CATCATEGORY_NAME,
    CATCATEGORYNBR                              as CATCATEGORY_NBR,
    CATEGORY_KEY                                as CATEGORY_KEY,
    trim(CATFAMILYNAME, ' \r\f\t\n')            as CATFAMILY_NAME,
    CATFAMILYNBR                                as CATFAMILY_NBR,
    trim(CATLINENAME, ' \r\f\t\n')              as CATLINE_NAME,
    CATLINENBR                                  as CATLINE_NBR,
    trim(CATGRPNAME, ' \r\f\t\n')               as CAT_GRP_NAME,
    CATGRPNBR                                   as CAT_GRP_NBR,
    EDW_CREATE_TIMESTAMP                        as EDW_CREATE_TIMESTAMP,
    EDW_UPDATE_TIMESTAMP                        as EDW_UPDATE_TIMESTAMP
FROM
    raw_data