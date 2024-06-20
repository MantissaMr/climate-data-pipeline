
-- Staging model for manufacturing.petrochemicals_emissions_sources
SELECT * FROM {{ source('climate_data_manufacturing', 'petrochemicals_emissions_sources') }}
