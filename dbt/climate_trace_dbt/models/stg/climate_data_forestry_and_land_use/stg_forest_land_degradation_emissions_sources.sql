
-- Staging model for forestry_and_land_use.forest_land_degradation_emissions_sources
SELECT * FROM {{ source('climate_data_forestry_and_land_use', 'forest_land_degradation_emissions_sources') }}
