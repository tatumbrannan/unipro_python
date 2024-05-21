-- models/error_log.sql
{{ config(
    materialized='table'
) }}

with initial_data as (
    select
        null::timestamp as error_timestamp,
        null::varchar as invocation_id,
        null::varchar as error_message
    where 1=0
)

select * from initial_data