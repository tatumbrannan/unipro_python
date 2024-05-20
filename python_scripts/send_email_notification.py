import smtplib
from email.mime.text import MIMEText
from dbt.cli.main import dbtRunner, dbtRunnerResult

# Initialize dbtRunner
dbt = dbtRunner()

# Create CLI args for dbt run
cli_args = ["run"]

try:
    # Run dbt command
    res = dbt.invoke(cli_args)

    # Check if dbt job failed
    if any(r.status == "error" for r in res.result):
        # Extract relevant information about the failure
        error_tables = [r.node.name for r in res.result if r.status == "error"]
        error_message = "DBT job failed. Error tables: {}".format(", ".join(error_tables))
        run_started_at = "{{ run_started_at }}"
        invocation_id = "{{ invocation_id }}"
        exception = "Error details: " + ", ".join(error_tables)

        # Send email notification
        sender_email = "your_email@example.com"
        receiver_email = "recipient@example.com"
        smtp_server = "smtp.example.com"
        smtp_port = 587
        smtp_username = "your_smtp_username"
        smtp_password = "your_smtp_password"

        msg = MIMEText(error_message)
        msg["Subject"] = "DBT Job Failure Notification"
        msg["From"] = sender_email
        msg["To"] = receiver_email

        with smtplib.SMTP(smtp_server, smtp_port) as server:
            server.starttls()
            server.login(smtp_username, smtp_password)
            server.send_message(msg)

        print("Email notification sent.")

        # Log error in dbt
        dbt.cli.main.dbtRunner().invoke(["run-operation", "send_email_notification",
                                         "--args", f"'email_subject': 'DBT Job Failure Notification', 'email_body': '{error_message}', 'run_started_at': '{run_started_at}', 'invocation_id': '{invocation_id}', 'exception': '{exception}'"])
    else:
        print("DBT job completed successfully.")

except Exception as e:
    print(f"An error occurred: {e}")
