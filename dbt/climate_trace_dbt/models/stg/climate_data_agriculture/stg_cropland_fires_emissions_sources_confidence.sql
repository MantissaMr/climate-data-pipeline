
-- Staging model for agriculture.cropland_fires_emissions_sources_confidence
SELECT * FROM {{ source('climate_data_agriculture', 'cropland_fires_emissions_sources_confidence') }}
