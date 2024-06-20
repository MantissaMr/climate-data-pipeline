
-- Staging model for agriculture.manure_management_other_country_emissions
SELECT * FROM {{ source('climate_data_agriculture', 'manure_management_other_country_emissions') }}
