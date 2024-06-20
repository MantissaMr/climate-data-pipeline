
-- Staging model for transportation.international_aviation_country_emissions
SELECT * FROM {{ source('climate_data_transportation', 'international_aviation_country_emissions') }}
