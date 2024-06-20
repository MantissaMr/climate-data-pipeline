
-- Staging model for agriculture.manure_management_cattle_feedlot_emissions_sources
SELECT * FROM {{ source('climate_data_agriculture', 'manure_management_cattle_feedlot_emissions_sources') }}
