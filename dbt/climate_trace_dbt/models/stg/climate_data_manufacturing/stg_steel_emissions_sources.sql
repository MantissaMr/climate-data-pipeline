
-- Staging model for manufacturing.steel_emissions_sources
SELECT * FROM {{ source('climate_data_manufacturing', 'steel_emissions_sources') }}
