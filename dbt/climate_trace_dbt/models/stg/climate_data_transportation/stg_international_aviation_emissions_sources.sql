
-- Staging model for transportation.international_aviation_emissions_sources
SELECT * FROM {{ source('climate_data_transportation', 'international_aviation_emissions_sources') }}
