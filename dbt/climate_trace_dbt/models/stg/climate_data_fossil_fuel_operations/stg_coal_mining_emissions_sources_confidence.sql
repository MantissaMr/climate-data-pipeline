
-- Staging model for fossil_fuel_operations.coal_mining_emissions_sources_confidence
SELECT * FROM {{ source('climate_data_fossil_fuel_operations', 'coal_mining_emissions_sources_confidence') }}
