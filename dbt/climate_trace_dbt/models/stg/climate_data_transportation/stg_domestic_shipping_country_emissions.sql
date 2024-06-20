
-- Staging model for transportation.domestic_shipping_country_emissions
SELECT * FROM {{ source('climate_data_transportation', 'domestic_shipping_country_emissions') }}
