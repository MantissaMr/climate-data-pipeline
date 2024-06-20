
-- Staging model for power.electricity_generation_emissions_sources
SELECT * FROM {{ source('climate_data_power', 'electricity_generation_emissions_sources') }}
