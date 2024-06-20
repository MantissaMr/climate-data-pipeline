
-- Staging model for transportation.domestic_aviation_emissions_sources
SELECT * FROM {{ source('climate_data_transportation', 'domestic_aviation_emissions_sources') }}
