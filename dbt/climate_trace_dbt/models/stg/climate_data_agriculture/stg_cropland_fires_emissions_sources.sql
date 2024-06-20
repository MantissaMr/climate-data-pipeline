
-- Staging model for agriculture.cropland_fires_emissions_sources
SELECT * FROM {{ source('climate_data_agriculture', 'cropland_fires_emissions_sources') }}
