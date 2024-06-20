
-- Staging model for mineral_extraction.sand_quarrying_country_emissions
SELECT * FROM {{ source('climate_data_mineral_extraction', 'sand_quarrying_country_emissions') }}
