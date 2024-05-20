-- macros/send_email_notification.sql
{% macro send_email_notification(email_subject, email_body, invocation_id, exception) %}
    insert into {{ ref('error_log') }} (error_timestamp,invocation_id, error_message)
    values (
        current_timestamp,
        '{{ invocation_id }}',
        '{{ exception }}'
    );
{% endmacro %}
