
-- Staging model for forestry_and_land_use.net_forest_land_emissions_sources_confidence
SELECT * FROM {{ source('climate_data_forestry_and_land_use', 'net_forest_land_emissions_sources_confidence') }}
