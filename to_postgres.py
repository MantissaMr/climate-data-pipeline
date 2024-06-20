import pandas as pd
import zipfile as zp
import io
import requests
from sqlalchemy import create_engine
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# Create database engine 
engine = create_engine(f'postgresql+psycopg2://{POSTGRES_USER}:{POSTGRES_PASSWORD}@{POSTGRES_HOST}:5432/{POSTGRES_DB}') # type: ignore

def download_and_store_csvs_to_postgres(sector_name):
    url = f'https://downloads.climatetrace.org/v02/sector_packages/{sector_name}.zip'

    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise exception for bad status codes
        zip_content = io.BytesIO(response.content)

        # Open the zip file
        with zp.ZipFile(zip_content) as z:
            # Iterate over each file in the zip archive
            for file_info in z.infolist():
                # Check if the file is a CSV file in the 'DATA' folder
                if file_info.filename.startswith('DATA/') and file_info.filename.endswith('.csv'):
                    # Extract table name from the file name (optional)
                    table_name = file_info.filename.split('/')[-1].replace('.csv', '')
                    # Truncate table_name if it exceeds the allowed 63 characters
                    table_name = table_name[:63]

                    # Open the CSV file within the zip file
                    with z.open(file_info.filename) as f:
                        # Create an empty table based on the CSV structure
                        pd.read_csv(f, nrows=0).to_sql(table_name, engine, schema=sector_name, if_exists='replace', index=False)
                        
                        # Reopen the CSV file to read data in chunks
                        f.seek(0)
                        
                        for chunk in pd.read_csv(f, chunksize=50000, low_memory=False):
                            try:
                                chunk.to_sql(table_name, engine, schema=sector_name, if_exists='append', index=False)
                                logger.info(f"Uploaded another chunk to table {table_name}...")
                            except Exception as e:
                                logger.error(f"Error uploading chunk to table {table_name} in schema {sector_name}: {str(e)}")
                                # Optionally, handle the error (e.g., retry, skip, log)
        logger.info(f"Data successfully ingested to the schema: '{sector_name}'!")
    except Exception as e:
        logger.error(f"Error downloading or processing data for sector {sector_name}: {str(e)}")

if __name__ == "__main__":
    # Prompt the user to enter the sector name
    sector_name = input("Enter the sector name: ")

    download_and_store_csvs_to_postgres(sector_name)