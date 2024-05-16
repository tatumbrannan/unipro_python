import snowflake.connector
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from dynaconf import settings
import logging

# Configure logging
logging.basicConfig(level=logging.INFO, filename='send_email_notification.log')

# Load variables from Dynaconf
smtp_server = settings.get('SMTP_SERVER')
smtp_port = settings.get('SMTP_PORT')
smtp_username = settings.get('SMTP_USERNAME')
smtp_password = settings.get('SMTP_PASSWORD')
sender_email = settings.get('SENDER_EMAIL')
recipient_email = settings.get('RECIPIENT_EMAIL')

try:
    # Connect to Snowflake and fetch error log details
    conn = snowflake.connector.connect(
        user=settings.get('SNOWFLAKE_USERNAME'),  
        password=settings.get('SNOWFLAKE_PASSWORD'),  
        account=settings.get('SNOWFLAKE_ACCOUNT'),  
        warehouse=settings.get('SNOWFLAKE_WAREHOUSE'),  
        database=settings.get('SNOWFLAKE_DATABASE'),  
        schema=settings.get('SNOWFLAKE_SCHEMA')
    )

    cursor = conn.cursor()
    cursor.execute("SELECT * FROM error_log")
    error_log_data = cursor.fetchall()

    # Construct the email
    message = MIMEMultipart()
    message["From"] = sender_email
    message["To"] = recipient_email
    message["Subject"] = "DBT Job Failure Notification"

    body = "The DBT job has failed. Here are the details from the error_log table:\n\n"
    for row in error_log_data:
        body += str(row) + "\n"

    message.attach(MIMEText(body, "plain"))

    # Send the email
    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.starttls()
        server.login(smtp_username, smtp_password)
        server.sendmail(sender_email, recipient_email, message.as_string())
        logging.info("Email sent successfully")

except Exception as e:
    logging.error(f"Error: {e}")

finally:
    if 'conn' in locals():
        conn.close()
