
-- Staging model for fossil_fuel_operations.solid_fuel_transformation_country_emissions
SELECT * FROM {{ source('climate_data_fossil_fuel_operations', 'solid_fuel_transformation_country_emissions') }}
