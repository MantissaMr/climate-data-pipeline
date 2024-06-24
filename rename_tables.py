# This python script rename the names goes through each schema on my db and rename the column name so that it doesn't
# exceed the allocated character limit of 63 characters

import psycopg2
from psycopg2 import sql
import os
from dotenv import load_dotenv

# Database connection parameters
db_params = {
    'dbname': os.getenv('POSTGRES_DB'),
    'user': os.getenv('POSTGRES_USER'),
    'password': os.getenv('POSTGRES_PASSWORD'),
    'host': os.getenv('POSTGRES_HOST'),
    'port': 5432
}

# Function to rename tables
def rename_tables():
    try:
        # Connect to the database
        conn = psycopg2.connect(**db_params)
        cursor = conn.cursor()

        # Query to find tables with "-"
        query = """
        SELECT table_schema, table_name
        FROM information_schema.tables
        WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
          AND table_name LIKE '%-%'
        """

        cursor.execute(query)
        tables_to_rename = cursor.fetchall()

        # Generate and execute ALTER TABLE statements
        for schema, old_name in tables_to_rename:
            new_name = old_name.replace('-', '_')
            alter_stmt = sql.SQL("ALTER TABLE {}.{} RENAME TO {};").format(
                sql.Identifier(schema), sql.Identifier(old_name), sql.Identifier(new_name)
            )
            cursor.execute(alter_stmt)
            print(f"Renamed table {old_name} to {new_name}")

        # Commit the changes
        conn.commit()
        print("All tables renamed successfully!")

    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
    finally:
        if conn:
            cursor.close()
            conn.close()

# Execute the rename_tables function
rename_tables()