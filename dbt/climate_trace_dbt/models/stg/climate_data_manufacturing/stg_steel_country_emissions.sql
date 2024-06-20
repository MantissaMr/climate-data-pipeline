
-- Staging model for manufacturing.steel_country_emissions
SELECT * FROM {{ source('climate_data_manufacturing', 'steel_country_emissions') }}
