
-- Staging model for power.other_energy_use_country_emissions
SELECT * FROM {{ source('climate_data_power', 'other_energy_use_country_emissions') }}
