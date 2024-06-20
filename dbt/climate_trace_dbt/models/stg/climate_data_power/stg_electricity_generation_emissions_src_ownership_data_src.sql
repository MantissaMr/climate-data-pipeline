
-- Staging model for power.electricity_generation_emissions_sources_ownership_data_source
SELECT * FROM {{ source('climate_data_power', 'electricity_generation_emissions_sources_ownership_data_source') }}
