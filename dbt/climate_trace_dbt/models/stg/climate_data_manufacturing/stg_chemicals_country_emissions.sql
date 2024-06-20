
-- Staging model for manufacturing.chemicals_country_emissions
SELECT * FROM {{ source('climate_data_manufacturing', 'chemicals_country_emissions') }}
