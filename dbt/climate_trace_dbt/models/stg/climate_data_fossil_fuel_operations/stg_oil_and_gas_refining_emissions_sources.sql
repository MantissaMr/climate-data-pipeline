
-- Staging model for fossil_fuel_operations.oil_and_gas_refining_emissions_sources
SELECT * FROM {{ source('climate_data_fossil_fuel_operations', 'oil_and_gas_refining_emissions_sources') }}
