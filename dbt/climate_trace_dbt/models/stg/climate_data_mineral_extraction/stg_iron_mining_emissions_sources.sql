
-- Staging model for mineral_extraction.iron_mining_emissions_sources
SELECT * FROM {{ source('climate_data_mineral_extraction', 'iron_mining_emissions_sources') }}
