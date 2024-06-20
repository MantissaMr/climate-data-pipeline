
-- Staging model for agriculture.rice_cultivation_emissions_sources_confidence
SELECT * FROM {{ source('climate_data_agriculture', 'rice_cultivation_emissions_sources_confidence') }}
