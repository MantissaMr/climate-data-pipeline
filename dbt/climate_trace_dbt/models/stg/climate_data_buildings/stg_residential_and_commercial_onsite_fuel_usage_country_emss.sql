
-- Staging model for buildings.residential_and_commercial_onsite_fuel_usage_country_emissions
SELECT * FROM {{ source('climate_data_buildings', 'residential_and_commercial_onsite_fuel_usage_country_emissions') }}
