-- models/aluminum_emissions_with_confidence.sql
WITH aluminum_emissions AS (
    SELECT
        source_id,
        source_name,
        source_type,
        iso3_country,
        sector,
        subsector,
        lat,
        lon,
        gas,
        SUM(emissions_quantity) AS total_emissions_quantity, -- Aggregating emissions quantity
        MAX(temporal_granularity) AS max_temporal_granularity, -- Assuming temporal granularity doesn't change, take max value
        MAX(activity) AS max_activity, -- Assuming activity doesn't change, take max value
        MAX(emissions_factor) AS max_emissions_factor, -- Assuming emissions factor doesn't change, take max value
        MAX(capacity) AS max_capacity, -- Assuming capacity doesn't change, take max value
        MAX(capacity_factor) AS max_capacity_factor -- Assuming capacity factor doesn't change, take max value
    FROM {{ ref('stg_aluminum_emissions_sources') }}
    GROUP BY source_id, source_name, source_type, iso3_country, sector, subsector, lat, lon, gas
),
aluminum_confidence AS (
    SELECT
        source_id,
        COUNT(*) FILTER (WHERE co2_emissions = 'very low') AS very_low_co2_emissions,
        COUNT(*) FILTER (WHERE co2_emissions = 'low') AS low_co2_emissions,
        COUNT(*) FILTER (WHERE co2_emissions = 'medium') AS medium_co2_emissions,
        COUNT(*) FILTER (WHERE co2_emissions = 'high') AS high_co2_emissions,
        COUNT(*) FILTER (WHERE co2_emissions = 'very high') AS very_high_co2_emissions,
        COUNT(*) FILTER (WHERE ch4_emissions = 'very low') AS very_low_ch4_emissions,
        COUNT(*) FILTER (WHERE ch4_emissions = 'low') AS low_ch4_emissions,
        COUNT(*) FILTER (WHERE ch4_emissions = 'medium') AS medium_ch4_emissions,
        COUNT(*) FILTER (WHERE ch4_emissions = 'high') AS high_ch4_emissions,
        COUNT(*) FILTER (WHERE ch4_emissions = 'very high') AS very_high_ch4_emissions,
        COUNT(*) FILTER (WHERE n2o_emissions = 'very low') AS very_low_n2o_emissions,
        COUNT(*) FILTER (WHERE n2o_emissions = 'low') AS low_n2o_emissions,
        COUNT(*) FILTER (WHERE n2o_emissions = 'medium') AS medium_n2o_emissions,
        COUNT(*) FILTER (WHERE n2o_emissions = 'high') AS high_n2o_emissions,
        COUNT(*) FILTER (WHERE n2o_emissions = 'very high') AS very_high_n2o_emissions,
        MAX(co2_emissions_factor) AS max_co2_emissions_factor, -- Assuming CO2 emissions factor doesn't change, take max value
        MAX(ch4_emissions_factor) AS max_ch4_emissions_factor, -- Assuming CH4 emissions factor doesn't change, take max value
        MAX(n2o_emissions_factor) AS max_n2o_emissions_factor, -- Assuming N2O emissions factor doesn't change, take max value
        COUNT(*) FILTER (WHERE total_co2e_20yrgwp = 'very low') AS very_low_total_co2e_20yrgwp,
        COUNT(*) FILTER (WHERE total_co2e_20yrgwp = 'low') AS low_total_co2e_20yrgwp,
        COUNT(*) FILTER (WHERE total_co2e_20yrgwp = 'medium') AS medium_total_co2e_20yrgwp,
        COUNT(*) FILTER (WHERE total_co2e_20yrgwp = 'high') AS high_total_co2e_20yrgwp,
        COUNT(*) FILTER (WHERE total_co2e_20yrgwp = 'very high') AS very_high_total_co2e_20yrgwp,
        COUNT(*) FILTER (WHERE total_co2e_100yrgwp = 'very low') AS very_low_total_co2e_100yrgwp,
        COUNT(*) FILTER (WHERE total_co2e_100yrgwp = 'low') AS low_total_co2e_100yrgwp,
        COUNT(*) FILTER (WHERE total_co2e_100yrgwp = 'medium') AS medium_total_co2e_100yrgwp,
        COUNT(*) FILTER (WHERE total_co2e_100yrgwp = 'high') AS high_total_co2e_100yrgwp,
        COUNT(*) FILTER (WHERE total_co2e_100yrgwp = 'very high') AS very_high_total_co2e_100yrgwp
    FROM {{ ref('stg_aluminum_emissions_sources_confidence') }}
    GROUP BY source_id
)
SELECT
    e.source_id,
    e.source_name,
    e.source_type,
    e.iso3_country,
    e.sector,
    e.subsector,
    e.lat,
    e.lon,
    e.gas,
    e.total_emissions_quantity,
    e.max_temporal_granularity,
    e.max_activity,
    e.max_emissions_factor,
    e.max_capacity,
    e.max_capacity_factor,
    c.very_low_co2_emissions,
    c.low_co2_emissions,
    c.medium_co2_emissions,
    c.high_co2_emissions,
    c.very_high_co2_emissions,
    c.very_low_ch4_emissions,
    c.low_ch4_emissions,
    c.medium_ch4_emissions,
    c.high_ch4_emissions,
    c.very_high_ch4_emissions,
    c.very_low_n2o_emissions,
    c.low_n2o_emissions,
    c.medium_n2o_emissions,
    c.high_n2o_emissions,
    c.very_high_n2o_emissions,
    c.max_co2_emissions_factor,
    c.max_ch4_emissions_factor,
    c.max_n2o_emissions_factor,
    c.very_low_total_co2e_20yrgwp,
    c.low_total_co2e_20yrgwp,
    c.medium_total_co2e_20yrgwp,
    c.high_total_co2e_20yrgwp,
    c.very_high_total_co2e_20yrgwp,
    c.very_low_total_co2e_100yrgwp,
    c.low_total_co2e_100yrgwp,
    c.medium_total_co2e_100yrgwp,
    c.high_total_co2e_100yrgwp,
    c.very_high_total_co2e_100yrgwp
FROM
    aluminum_emissions e
LEFT JOIN
    aluminum_confidence c
ON
    e.source_id = c.source_id