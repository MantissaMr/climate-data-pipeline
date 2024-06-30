# This script generates dbt staging models based on the name of a table, following the 
# format stg_table_name.. Each stg model is basically:
# a SELECT * FROM TABLE_NAME, with table_name being referenced from a source_yaml file called
# src_climate_data.yml, containing definition of sources and their identifiers 

import os
from dotenv import load_dotenv
import psycopg2
import yaml

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
cur = conn.cursor()

# Directory to save dbt staging models
models_dir = '../dbt/climate_trace_dbt/models/stg/'

# Load YAML file with table details
yaml_file = '../dbt/climate_trace_dbt/models/src_climate_data.yml'
with open(yaml_file, 'r') as f:
    sources_data = yaml.safe_load(f)

# Generate SQL files for staging models
for source in sources_data['sources']:
    database_name = source['database']
    source_name = source['name']
    schema = source['schema']
    
    for table_data in source['tables']:
        table_name = table_data['name']
        
        # Create directory if it doesn't exist
        source_dir = os.path.join(models_dir, source_name)
        os.makedirs(source_dir, exist_ok=True)
        
        # File path for SQL file
        sql_filename = os.path.join(source_dir, f"stg_{table_name}.sql")
        
        # Construct the SQL content using dbt's source() macro format
        sql_content = f"""
-- Staging model for {schema}.{table_name}
SELECT * FROM {{{{ source('{source_name}', '{table_name}') }}}}
"""
        
        # Write SQL content to file
        with open(sql_filename, 'w') as f_sql:
            f_sql.write(sql_content)

# Close the database connection
cur.close()
conn.close()