WITH raw_data AS (
    SELECT
        *
    FROM
        {{ source('snowflake_s3','date_dimension') }}
)

SELECT 
    CALENDAR_DATE                                   as CALENDAR_DATE,
    CALENDAR_DAY_NUMBER                             as CALENDAR_DAY_NUMBER,
    CALENDAR_MONTH_DAY_NUMBER                       as CALENDAR_MONTH_DAY_NUMBER,
    trim(CALENDAR_MONTH_END_FLAG, ' \r\f\t\n')      as CALENDAR_MONTH_END_FLAG,
    trim(CALENDAR_MONTH_NAME, ' \r\f\t\n')          as CALENDAR_MONTH_NAME,
    CALENDAR_MONTH_NUMBER                           as CALENDAR_MONTH_NUMBER,
    trim(CALENDAR_QUARTER_END_FLAG, ' \r\f\t\n')    as CALENDAR_QUARTER_END_FLAG,
    CALENDAR_QUARTER_NUMBER                         as CALENDAR_QUARTER_NUMBER,
    trim(CALENDAR_WEEK_DAY_NAME, ' \r\f\t\n')       as CALENDAR_WEEK_DAY_NAME,
    CALENDAR_WEEK_DAY_NUMBER                        as CALENDAR_WEEK_DAY_NUMBER,
    CALENDAR_WEEK_NUMBER                            as CALENDAR_WEEK_NUMBER,
    trim(CALENDAR_YEAR_END_FLAG, ' \r\f\t\n')       as CALENDAR_YEAR_END_FLAG,
    CALENDAR_YEAR                                   as CALENDAR_YEAR,
    trim(CALENDAR_YEARMONTH, ' \r\f\t\n')           as CALENDAR_YEARMONTH,
    trim(CALENDAR_YEARQUARTER, ' \r\f\t\n')         as CALENDAR_YEARQUARTER,
    trim(CALENDAR_YEARWEEK, ' \r\f\t\n')            as CALENDAR_YEARWEEK,
    DATE_KEY                                        as DATE_KEY,
    trim(DATE_TYPE, ' \r\f\t\n')                    as DATE_TYPE,
    trim(EDACLOSEFLAG, ' \r\f\t\n')                 as EDACLOSE_FLAG,
    EDACLOSEMNTH                                    as EDACLOSE_MNTH,
    EDACLOSEYEAR                                    as EDACLOSE_YEAR,
    EDADAY                                          as EDADAY,
    trim(EDAENDDATE, ' \r\f\t\n')                   as EDAEND_DATE,
    trim(EDAMNTH, ' \r\f\t\n')                      as EDAMNTH,
    trim(EDAQTR, ' \r\f\t\n')                       as EDAQTR,
    trim(EDASTARTDATE, ' \r\f\t\n')                 as EDASTART_DATE,
    trim(EDAWEEK, ' \r\f\t\n')                      as EDAWEEK,
    trim(EDAYEARENDFLG, ' \r\f\t\n')                as EDAYEAR_END_FLG,
    trim(EDAYEARMNTH, ' \r\f\t\n')                  as EDAYEAR_MNTH,
    trim(EDAYEARQTR, ' \r\f\t\n')                   as EDAYEAR_QTR,
    trim(EDAYEARWEEK, ' \r\f\t\n')                  as EDAYEAR_WEEK,
    trim(EDAYEAR, ' \r\f\t\n')                      as EDAYEAR,
    FISCALMNT                                       as FISCAL_MNT,
    FISCALQTR                                       as FISCAL_QTR,
    FISCALWEEK                                      as FISCAL_WEEK,
    FISCALYEAR                                      as FISCAL_YEAR,
    trim(PTPERIOD, ' \r\f\t\n')                     as PTPERIOD,
    trim(PTWEEK, ' \r\f\t\n')                       as PTWEEK,
    trim(PTYEAR, ' \r\f\t\n')                       as PTYEAR,
    trim(TSMONTH, ' \r\f\t\n')                      as TSMONTH,
    trim(TSYEAR, ' \r\f\t\n')                       as TSYEAR
FROM
    raw_data