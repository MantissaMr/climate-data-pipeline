
-- Staging model for manufacturing.other_manufacturing_emissions_sources
SELECT * FROM {{ source('climate_data_manufacturing', 'other_manufacturing_emissions_sources') }}
