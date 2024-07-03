-- models/sample_model_to_check_CICD.sql

    SELECT 
        source_name,
        source_type,
        iso3_country AS forest_iso3_country
    FROM {{ ref('stg_forest_land_degradation_emissions_sources') }}