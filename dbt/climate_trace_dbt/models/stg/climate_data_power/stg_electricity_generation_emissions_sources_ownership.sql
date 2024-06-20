
-- Staging model for power.electricity_generation_emissions_sources_ownership
SELECT * FROM {{ source('climate_data_power', 'electricity_generation_emissions_sources_ownership') }}
