
-- Staging model for agriculture.enteric_fermentation_cattle_pasture_emissions_sources_confidenc
SELECT * FROM {{ source('climate_data_agriculture', 'enteric_fermentation_cattle_pasture_emissions_sources_confidenc') }}
