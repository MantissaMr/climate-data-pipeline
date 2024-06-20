
-- Staging model for forestry_and_land_use.removals_country_emissions
SELECT * FROM {{ source('climate_data_forestry_and_land_use', 'removals_country_emissions') }}
