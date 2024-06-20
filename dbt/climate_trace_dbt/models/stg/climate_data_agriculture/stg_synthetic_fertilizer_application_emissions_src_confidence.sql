
-- Staging model for agriculture.synthetic_fertilizer_application_emissions_sources_confidence
SELECT * FROM {{ source('climate_data_agriculture', 'synthetic_fertilizer_application_emissions_sources_confidence') }}
