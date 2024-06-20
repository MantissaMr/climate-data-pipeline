
-- Staging model for manufacturing.steel_emissions_sources_ownership_data_source
SELECT * FROM {{ source('climate_data_manufacturing', 'steel_emissions_sources_ownership_data_source') }}
