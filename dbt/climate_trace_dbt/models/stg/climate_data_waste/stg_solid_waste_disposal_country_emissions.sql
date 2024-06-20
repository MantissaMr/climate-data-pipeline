
-- Staging model for waste.solid_waste_disposal_country_emissions
SELECT * FROM {{ source('climate_data_waste', 'solid_waste_disposal_country_emissions') }}
