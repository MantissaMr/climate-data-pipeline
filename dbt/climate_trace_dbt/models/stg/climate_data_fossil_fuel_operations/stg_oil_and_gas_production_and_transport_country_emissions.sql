
-- Staging model for fossil_fuel_operations.oil_and_gas_production_and_transport_country_emissions
SELECT * FROM {{ source('climate_data_fossil_fuel_operations', 'oil_and_gas_production_and_transport_country_emissions') }}
