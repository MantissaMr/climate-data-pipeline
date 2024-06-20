
-- Staging model for agriculture.manure_management_cattle_feedlot_country_emissions
SELECT * FROM {{ source('climate_data_agriculture', 'manure_management_cattle_feedlot_country_emissions') }}
