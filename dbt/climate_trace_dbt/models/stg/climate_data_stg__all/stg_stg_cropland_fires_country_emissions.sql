
-- Staging model for stg__all.stg_cropland_fires_country_emissions
SELECT * FROM {{ source('climate_data_stg__all', 'stg_cropland_fires_country_emissions') }}
