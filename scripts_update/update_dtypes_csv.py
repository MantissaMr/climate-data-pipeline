# This one updates the dtypes of column names in batch on the schemas_all.csv file , so it 
# can be used to update said columns on postgres

import pandas as pd
# Read the CSV file into a pandas DataFrame
df = pd.read_csv('data/dtype_batch.csv')

# Define your conditions for replacement
conditions = {
    'sector': 'string',
    'modified_date': 'datetime'
    
}

# Apply conditional replacement using .loc
df.loc[df['column'] == 'capacity_factor', 'inferred_dtype'] = 'float8'
df.loc[df['column'] == 'company_id', 'inferred_dtype'] = 'bigint'
df.loc[df['column'] == 'created_date', 'inferred_dtype'] = 'timestamp'
df.loc[df['column'] == 'emissions_factor', 'inferred_dtype'] = 'float8'
df.loc[df['column'] == 'emissions_quantity', 'inferred_dtype'] = 'float4'
df.loc[df['column'] == 'end_date', 'inferred_dtype'] = 'timestamp'
df.loc[df['column'] == 'end_time', 'inferred_dtype'] = 'timestamp'
df.loc[df['column'] == 'lat', 'inferred_dtype'] = 'float4'
df.loc[df['column'] == 'lon', 'inferred_dtype'] = 'float4'
df.loc[df['column'] == 'modified_date', 'inferred_dtype'] = 'timestamp'
df.loc[df['column'] == 'percent_interest_company', 'inferred_dtype'] = 'float4'
df.loc[df['column'] == 'percent_interest_parent', 'inferred_dtype'] = 'float4'
df.loc[df['column'] == 'reference_id', 'inferred_dtype'] = 'int'
df.loc[df['column'] == 'source_id', 'inferred_dtype'] = 'bigint'
df.loc[df['column'] == 'start_date', 'inferred_dtype'] = 'timestamp'
df.loc[df['column'] == 'start_time', 'inferred_dtype'] = 'timestamp'
df.loc[df['column'] == 'ultimate_parent_id', 'inferred_dtype'] = 'bigint'


# Save the modified DataFrame back to a new CSV file
df.to_csv('data/updated_dtype_batch.csv', index=False)

print("Data processing and saving complete.")
