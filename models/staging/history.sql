WITH raw_data as (
    SELECT
        *
    FROM
        {{ source('snowflake_s3','history') }}
)
SELECT
    EDDUDS                                     as MEMBER_DUNS_NUMBER,
    EDDUD4                                     as MEMBER_DUNS_NUMBER_4,
    EDDUSU                                     as PURCHASE_SUPPLIER_DUNS_NUMBER,
    EDDUS4                                     as PURCHASE_SUPPLIER_DUNS_NUMBER_4,
    trim(EDSUP, ' \r\f\t\n')                   as MEMBER_SUPPLIER_NUMBER,
    EDINV                                      as INVOICE_NUMBER,
    EDINVD                                     as INVOICE_DATE,
    EDUPC1                                     as UPC_PACK_IND,
    EDUPC2                                     as UPC_NUMBER_SYSTEM,
    EDUPC3                                     as UPC_MFG_NUMBER,
    EDUPC4                                     as UPC_ITEM_NUMBER,
    EDUPC5                                     as UPC_CHECK_DIGIT,
    EDQTY                                      as QTY_SHIPPED_MEMBER,
    trim(EDPUOM, ' \r\f\t\n')                  as UOM,
    EDNETW                                     as NET_WEIGHT,
    EDAMT                                      as PURCHASE_AMT,
    EDFRTF                                     as FREIGHT_INCLUDED_IND,
    EDEXCF                                     as ITEM_EXCEPTION_IND,
    trim(EDMREF, ' \r\f\t\n')                  as COMMENT,
    regexp_replace(EDCATG, '[ \r\f\t\n]+')     as MEMBER_DEPARTMENT,
    trim(edmPO, ' \r\f\t\n')                   as MEMBER_PO_NUMBER,
    lpad(trim(EDGTIN),14,'0')                  as GTIN,
    trim(EDMFID, ' \r\f\t\n')                  as MFG_ITEM_NUMBER,
    EDROW                                      as SPREADSHEET_ROW,
    EDPROC                                     as PROCESSED_FLAG,
    to_date(to_char(EDDATE), 'YYYYMMDD')       as DATE_CREATED,
    to_time(to_varchar(EDTIME),'HH24MISS')     as TIME_CREATED,
    EDUSER                                     as USERID_CREATED,
    EDPGM                                      as PROGRAM_CREATED,
    try_to_timestamp_ntz(to_date(to_char(EDDATP), 'YYYYMMDD')||' '||to_time(to_varchar(EDTIMP),'HH24MISS')) as DATE_TIME_PROCESSED,
    EDUSEP                                     as USERID_PROCESSED,
    EDPGMP                                     as PROGRAM_PROCESSED
FROM raw_data