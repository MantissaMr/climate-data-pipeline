
-- Staging model for mineral_extraction.bauxite_mining_country_emissions
SELECT * FROM {{ source('climate_data_mineral_extraction', 'bauxite_mining_country_emissions') }}
