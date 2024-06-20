
-- Staging model for mineral_extraction.rock_quarrying_country_emissions
SELECT * FROM {{ source('climate_data_mineral_extraction', 'rock_quarrying_country_emissions') }}
