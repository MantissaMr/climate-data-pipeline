
-- Staging model for manufacturing.pulp_and_paper_country_emissions
SELECT * FROM {{ source('climate_data_manufacturing', 'pulp_and_paper_country_emissions') }}
