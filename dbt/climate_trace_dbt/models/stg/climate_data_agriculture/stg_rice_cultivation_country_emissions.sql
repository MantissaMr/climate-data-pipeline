
-- Staging model for agriculture.rice_cultivation_country_emissions
SELECT * FROM {{ source('climate_data_agriculture', 'rice_cultivation_country_emissions') }}
