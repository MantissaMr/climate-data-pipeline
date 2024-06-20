
-- Staging model for transportation.railways_country_emissions
SELECT * FROM {{ source('climate_data_transportation', 'railways_country_emissions') }}
