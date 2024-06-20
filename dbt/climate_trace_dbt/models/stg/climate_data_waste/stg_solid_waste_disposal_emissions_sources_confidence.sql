
-- Staging model for waste.solid_waste_disposal_emissions_sources_confidence
SELECT * FROM {{ source('climate_data_waste', 'solid_waste_disposal_emissions_sources_confidence') }}
