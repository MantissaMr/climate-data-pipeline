
-- Staging model for forestry_and_land_use.net_forest_land_country_emissions
SELECT * FROM {{ source('climate_data_forestry_and_land_use', 'net_forest_land_country_emissions') }}
