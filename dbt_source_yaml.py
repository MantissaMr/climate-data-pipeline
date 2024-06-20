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

# Query to get schemas and tables
query = """
SELECT table_schema, table_name 
FROM information_schema.tables 
WHERE table_schema NOT IN ('information_schema', 'pg_catalog') 
ORDER BY table_schema, table_name;
"""
cur.execute(query)
rows = cur.fetchall()

# Organize data into a nested dictionary
data = {}
for schema, table in rows:
    if schema not in data:
        data[schema] = []
    data[schema].append({'name': table, 'identifier': table})

# Structure for the YAML file
yaml_structure = {
    'version': 2,
    'sources': []
}

# Populate schemas and tables in YAML structure
for schema, tables in data.items():
    source_name = f"climate_data_{schema}"
    schema_dict = {
        'name': source_name,
        'database': db_config['dbname'],
        'schema': schema,
        'tables': tables
    }
    yaml_structure['sources'].append(schema_dict)

# Write the YAML file
output_path = 'dbt/climate_trace_dbt/models/src_climate_data.yml'
os.makedirs(os.path.dirname(output_path), exist_ok=True)
with open(output_path, 'w') as file:
    yaml.dump(yaml_structure, file, sort_keys=False, default_flow_style=False)

# Close the database connection
cur.close()
conn.close()