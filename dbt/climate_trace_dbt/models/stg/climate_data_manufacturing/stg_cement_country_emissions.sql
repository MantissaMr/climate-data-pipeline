
-- Staging model for manufacturing.cement_country_emissions
SELECT * FROM {{ source('climate_data_manufacturing', 'cement_country_emissions') }}
