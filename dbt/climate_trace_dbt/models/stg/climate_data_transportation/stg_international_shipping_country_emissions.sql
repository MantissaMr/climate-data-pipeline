
-- Staging model for transportation.international_shipping_country_emissions
SELECT * FROM {{ source('climate_data_transportation', 'international_shipping_country_emissions') }}
