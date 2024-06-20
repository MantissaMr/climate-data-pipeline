
-- Staging model for manufacturing.cement_emissions_sources_ownership
SELECT * FROM {{ source('climate_data_manufacturing', 'cement_emissions_sources_ownership') }}
