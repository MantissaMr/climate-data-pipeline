
-- Staging model for manufacturing.aluminum_country_emissions
SELECT * FROM {{ source('climate_data_manufacturing', 'aluminum_country_emissions') }}
