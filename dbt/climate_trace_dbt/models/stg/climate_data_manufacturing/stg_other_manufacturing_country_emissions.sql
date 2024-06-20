
-- Staging model for manufacturing.other_manufacturing_country_emissions
SELECT * FROM {{ source('climate_data_manufacturing', 'other_manufacturing_country_emissions') }}
