
-- Staging model for mineral_extraction.bauxite_mining_emissions_sources
SELECT * FROM {{ source('climate_data_mineral_extraction', 'bauxite_mining_emissions_sources') }}
