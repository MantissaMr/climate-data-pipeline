
-- Staging model for power.electricity_generation_country_emissions
SELECT * FROM {{ source('climate_data_power', 'electricity_generation_country_emissions') }}
