-- models/aa_ml_engineers/pivoted_water_reservoirs_emissions.sql

WITH base AS (
    SELECT
        start_time,
        end_time,
        modified_date,
        gas,
        emissions_quantity
    FROM {{ ref('stg_water_reservoirs_country_emissions') }}
),
pivoted AS (
    SELECT
        start_time,
        end_time,
        modified_date,
        SUM(CASE WHEN gas = 'n2o' THEN emissions_quantity ELSE 0 END) AS n2o_emissions,
        SUM(CASE WHEN gas = 'co2' THEN emissions_quantity ELSE 0 END) AS co2_emissions,
        SUM(CASE WHEN gas = 'ch4' THEN emissions_quantity ELSE 0 END) AS ch4_emissions,
        SUM(CASE WHEN gas = 'co2e_20yr' THEN emissions_quantity ELSE 0 END) AS co2e_20yr_emissions,
        SUM(CASE WHEN gas = 'co2e_100yr' THEN emissions_quantity ELSE 0 END) AS co2e_100yr_emissions
    FROM base
    GROUP BY start_time, end_time, modified_date
)

SELECT
    start_time,
    end_time,
    modified_date,
    n2o_emissions,
    co2_emissions,
    ch4_emissions,
    co2e_20yr_emissions,
    co2e_100yr_emissions
FROM pivoted