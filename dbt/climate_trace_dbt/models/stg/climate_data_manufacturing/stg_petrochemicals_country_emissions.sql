
-- Staging model for manufacturing.petrochemicals_country_emissions
SELECT * FROM {{ source('climate_data_manufacturing', 'petrochemicals_country_emissions') }}
