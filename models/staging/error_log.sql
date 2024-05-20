-- models/error_log.sql
{{ config(
    materialized='incremental',
    unique_key='invocation_id'
) }}

with new_data as (
    select
        current_timestamp as error_timestamp,
        '{{ run_started_at }}'::timestamp as run_started_at,
        '{{ invocation_id }}' as invocation_id,
        '{{ exception }}' as error_message
    where 1=0
)

select * from new_data
