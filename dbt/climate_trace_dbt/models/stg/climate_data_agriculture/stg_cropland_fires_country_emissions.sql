
-- Staging model for agriculture.cropland_fires_country_emissions
SELECT * FROM {{ source('climate_data_agriculture', 'cropland_fires_country_emissions') }}
