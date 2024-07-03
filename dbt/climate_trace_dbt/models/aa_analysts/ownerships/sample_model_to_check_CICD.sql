-- models/sample_model_to_check_CICD.sql

WITH forest_land_degradation_emissions_sources AS (
    SELECT  
        source_id,
        source_name,
        source_type,
        iso3_country AS forest_iso3_country,
        sector AS forest_sector
    FROM {{ ref('stg_forest_land_degradation_emissions_sources') }}
),
shrubgrass_fires_country_emissions AS (
    SELECT  
        iso3_country AS shrubgrass_iso3_country,
        sector AS shrubgrass_sector
    FROM {{ ref('stg_shrubgrass_fires_country_emissions') }}
)

SELECT *
FROM forest_land_degradation_emissions_sources f
JOIN shrubgrass_fires_country_emissions s
    ON f.forest_iso3_country = s.shrubgrass_iso3_country