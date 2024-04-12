import os
import pandas as pd
import snowflake.connector
import re
import boto3
import tempfile


# Function to convert Excel files to CSV
def excel_to_csv(bucket_name, csv_folder):

    # Initialize the S3 client
    s3 = boto3.client('s3')

    # List objects in the S3 bucket
    response = s3.list_objects_v2(Bucket=bucket_name)

    # Iterate through each object in the response
    for obj in response.get('Contents', []):
        # Extract the key (file path) of the object
        key = obj['Key']
        
        # Check if the object is an Excel file
        if key.endswith('.xlsx'):
            try:
                # Create a temporary file to store Excel content
                with tempfile.NamedTemporaryFile(suffix=".xlsx", delete=False) as temp_excel_file:
                    temp_excel_path = temp_excel_file.name
                
                # Download the Excel file from S3 to the temporary file
                s3.download_file(bucket_name, key, temp_excel_path)
                
                # Load the Excel file into a DataFrame
                df = pd.read_excel(temp_excel_path)
                
                # Convert DataFrame to CSV
                csv_filename = os.path.splitext(os.path.basename(key))[0] + '.csv'
                csv_file_path = os.path.join(csv_folder, csv_filename)
                df.to_csv(csv_file_path, index=False)
                print(f"Converted {key} to CSV and saved to {csv_file_path}")
            except Exception as e:
                print(f"Error processing {key}: {e}")

    # Check if response is truncated (indicating more objects)
    while response.get('IsTruncated', False):
        # Get next page of objects
        response = s3.list_objects_v2(Bucket=bucket_name, ContinuationToken=response['NextContinuationToken'])
        
        # Iterate through each object in the response
        for obj in response.get('Contents', []):
            # Extract the key (file path) of the object
            key = obj['Key']
            
            # Check if the object is an Excel file
            if key.endswith('.xlsx'):
                try:
                    # Create a temporary file to store Excel content
                    with tempfile.NamedTemporaryFile(suffix=".xlsx", delete=False) as temp_excel_file:
                        temp_excel_path = temp_excel_file.name
                    
                    # Download the Excel file from S3 to the temporary file
                    s3.download_file(bucket_name, key, temp_excel_path)
                    
                    # Load the Excel file into a DataFrame
                    df = pd.read_excel(temp_excel_path)
                    
                    # Convert DataFrame to CSV
                    csv_filename = os.path.splitext(os.path.basename(key))[0] + '.csv'
                    csv_file_path = os.path.join(csv_folder, csv_filename)
                    df.to_csv(csv_file_path, index=False)
                    print(f"Converted {key} to CSV and saved to {csv_file_path}")
                except Exception as e:
                    print(f"Error processing {key}: {e}")



def lambda_handler(event,context):
    excel_to_csv('poc-spreadsheetsf', 'csv_folder')