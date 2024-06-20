
-- Staging model for forestry_and_land_use.wetland_fires_country_emissions
SELECT * FROM {{ source('climate_data_forestry_and_land_use', 'wetland_fires_country_emissions') }}
