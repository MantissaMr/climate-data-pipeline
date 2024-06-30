-- models/ownership_information.sql

WITH cement_ownership AS (
    SELECT
        source_id,
        source_name,
        iso3_country,
        sector,
        subsector,
        relationship,
        ultimate_parent_name,
        ultimate_parent_id,
        company_name,
        company_id,
        percent_interest_company,
        start_date,
        end_date,
        created_date,
        modified_date
    FROM {{ ref('stg_cement_emissions_sources_ownership') }}
),
aluminum_ownership AS (
    SELECT
        source_id,
        source_name,
        iso3_country,
        sector,
        subsector,
        relationship,
        ultimate_parent_name,
        ultimate_parent_id,
        company_name,
        company_id,
        percent_interest_company,
        start_date,
        end_date,
        created_date,
        modified_date
    FROM {{ ref('stg_aluminum_emissions_sources_ownership') }}
),
steel_ownership AS (
    SELECT
        source_id,
        source_name,
        iso3_country,
        sector,
        subsector,
        relationship,
        ultimate_parent_name,
        ultimate_parent_id,
        company_name,
        company_id,
        percent_interest_company,
        start_date,
        end_date,
        created_date,
        modified_date
    FROM {{ ref('stg_steel_emissions_sources_ownership') }}
),
combined_ownership AS (
    SELECT * FROM cement_ownership
    UNION ALL
    SELECT * FROM aluminum_ownership
    UNION ALL
    SELECT * FROM steel_ownership
)
SELECT
    source_id,
    source_name,
    iso3_country,
    sector,
    subsector,
    relationship,
    ultimate_parent_name,
    ultimate_parent_id,
    company_name,
    company_id,
    percent_interest_company,
    start_date,
    end_date,
    created_date,
    modified_date
FROM
    combined_ownership