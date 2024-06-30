# This script export a csv file containing all dtypes of all columns under all tables under all schemas.. 
# To ensure consistency, I will go through the csv file and validate the inferred dtypes 
# making sure they match what postgres accepts 

import pandas as pd
import psycopg2
import os
from dotenv import load_dotenv
from sqlalchemy import create_engine

# Load environment variables from .env file
load_dotenv()

# Database connection details from .env file
db_config = {
    'dbname': os.getenv('POSTGRES_DB'),
    'user': os.getenv('POSTGRES_USER'),
    'password': os.getenv('POSTGRES_PASSWORD'),
    'host': os.getenv('POSTGRES_HOST'),
    'port': 5432
}

# Connect to the database
conn = psycopg2.connect(**db_config)

# Create an SQLAlchemy engine for easier data manipulation
engine = create_engine(f"postgresql+psycopg2://{db_config['user']}:{db_config['password']}@{db_config['host']}:{db_config['port']}/{db_config['dbname']}")

# Get all tables and columns
query = """
SELECT table_schema, table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema NOT IN ('information_schema', 'pg_catalog');
"""
df = pd.read_sql_query(query, conn)

# Infer schema for each column based on sample data
inferred_schemas = []
for _, row in df.iterrows():
    schema = row['table_schema']
    table = row['table_name']
    column = row['column_name']

    # Fetch sample data for the column
    sample_query = f"SELECT {column} FROM {schema}.{table} LIMIT 100"
    sample_data = pd.read_sql_query(sample_query, engine)

    # Infer data type based on sample data
    inferred_dtype = pd.api.types.infer_dtype(sample_data[column], skipna=True)
    inferred_schemas.append({
        'schema': schema,
        'table': table,
        'column': column,
        'inferred_dtype': inferred_dtype
    })

# Create a DataFrame from the inferred schemas
inferred_df = pd.DataFrame(inferred_schemas)

# Save profiling results
inferred_df.to_csv('data/schemas_all.csv', index=False)

# Close the database connection
conn.close()