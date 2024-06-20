
-- Staging model for manufacturing.petrochemicals_emissions_sources_confidence
SELECT * FROM {{ source('climate_data_manufacturing', 'petrochemicals_emissions_sources_confidence') }}
