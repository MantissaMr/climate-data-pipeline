
-- Staging model for forestry_and_land_use.shrubgrass_fires_emissions_sources
SELECT * FROM {{ source('climate_data_forestry_and_land_use', 'shrubgrass_fires_emissions_sources') }}
