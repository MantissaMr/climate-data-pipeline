
-- Staging model for transportation.domestic_aviation_country_emissions
SELECT * FROM {{ source('climate_data_transportation', 'domestic_aviation_country_emissions') }}
