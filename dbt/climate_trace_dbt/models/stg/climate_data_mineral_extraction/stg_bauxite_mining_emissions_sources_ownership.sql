
-- Staging model for mineral_extraction.bauxite_mining_emissions_sources_ownership
SELECT * FROM {{ source('climate_data_mineral_extraction', 'bauxite_mining_emissions_sources_ownership') }}
