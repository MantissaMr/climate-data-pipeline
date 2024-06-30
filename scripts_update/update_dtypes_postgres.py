# This script updates the dtypes of columns in the updated_csv file affected columns, their originating tables and 
# schemas, with the a column (inferred_dtype) indicating the dtype it should update said postgres columns to 
import csv
import psycopg2
from dotenv import load_dotenv
import os

# Load environment variables from the .env file
load_dotenv()

# Fetch database connection details from environment variables
db_name = os.getenv('POSTGRES_DB')
db_user = os.getenv('POSTGRES_USER')
db_password = os.getenv('POSTGRES_PASSWORD')
db_host = os.getenv('POSTGRES_HOST')
db_port = 5432 

# Step 1: Read the CSV file
csv_file = 'data/updated_dtype_batch.csv'
updates = []

with open(csv_file, 'r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        updates.append(row)

# Step 2: Generate the SQL commands
def generate_alter_table_command(schema, table, column, inferred_dtype):
    if inferred_dtype in ['timestamp', 'timestamp without time zone']:
        return f'ALTER TABLE {schema}.{table} ALTER COLUMN {column} SET DATA TYPE {inferred_dtype} USING {column}::timestamp without time zone;'
    elif inferred_dtype == 'float4':
        return f'ALTER TABLE {schema}.{table} ALTER COLUMN {column} SET DATA TYPE real USING {column}::real;'
    elif inferred_dtype == 'float8':
        return f'ALTER TABLE {schema}.{table} ALTER COLUMN {column} SET DATA TYPE double precision USING {column}::double precision;'
    elif inferred_dtype == 'bigint':
        return f'ALTER TABLE {schema}.{table} ALTER COLUMN {column} SET DATA TYPE bigint USING {column}::bigint;'
    elif inferred_dtype == 'int':
        return f'ALTER TABLE {schema}.{table} ALTER COLUMN {column} SET DATA TYPE integer USING {column}::integer;'
    else:
        return f'ALTER TABLE {schema}.{table} ALTER COLUMN {column} SET DATA TYPE {inferred_dtype};'

sql_commands = [generate_alter_table_command(row['schema'], row['table'], row['column'], row['inferred_dtype']) for row in updates]

# Step 3: Execute the SQL commands
conn = psycopg2.connect(
    dbname=db_name,
    user=db_user,
    password=db_password,
    host=db_host,
    port=db_port
)
cur = conn.cursor()

for command in sql_commands:
    try:
        cur.execute(command)
        conn.commit()
        print(f"Executed: {command}")
    except Exception as e:
        conn.rollback()
        print(f"Error executing: {command}\n{e}")

cur.close()
conn.close()