
-- Staging model for manufacturing.steel_emissions_sources_confidence
SELECT * FROM {{ source('climate_data_manufacturing', 'steel_emissions_sources_confidence') }}
