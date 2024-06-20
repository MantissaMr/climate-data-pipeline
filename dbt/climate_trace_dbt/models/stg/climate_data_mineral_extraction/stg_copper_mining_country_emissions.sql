
-- Staging model for mineral_extraction.copper_mining_country_emissions
SELECT * FROM {{ source('climate_data_mineral_extraction', 'copper_mining_country_emissions') }}
