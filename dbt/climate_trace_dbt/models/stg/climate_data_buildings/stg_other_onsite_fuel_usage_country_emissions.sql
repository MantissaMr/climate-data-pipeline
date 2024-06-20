
-- Staging model for buildings.other_onsite_fuel_usage_country_emissions
SELECT * FROM {{ source('climate_data_buildings', 'other_onsite_fuel_usage_country_emissions') }}
