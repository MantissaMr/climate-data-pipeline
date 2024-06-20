
-- Staging model for agriculture.enteric_fermentation_cattle_pasture_emissions_sources
SELECT * FROM {{ source('climate_data_agriculture', 'enteric_fermentation_cattle_pasture_emissions_sources') }}
