
-- Staging model for mineral_extraction.copper_mining_emissions_sources_ownership
SELECT * FROM {{ source('climate_data_mineral_extraction', 'copper_mining_emissions_sources_ownership') }}
