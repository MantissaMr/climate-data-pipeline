
-- Staging model for fossil_fuel_operations.coal_mining_country_emissions
SELECT * FROM {{ source('climate_data_fossil_fuel_operations', 'coal_mining_country_emissions') }}
