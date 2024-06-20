
-- Staging model for fossil_fuel_operations.other_fossil_fuel_operations_country_emissions
SELECT * FROM {{ source('climate_data_fossil_fuel_operations', 'other_fossil_fuel_operations_country_emissions') }}
