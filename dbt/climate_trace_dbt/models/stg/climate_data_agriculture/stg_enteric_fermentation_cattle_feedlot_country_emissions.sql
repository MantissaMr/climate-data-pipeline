
-- Staging model for agriculture.enteric_fermentation_cattle_feedlot_country_emissions
SELECT * FROM {{ source('climate_data_agriculture', 'enteric_fermentation_cattle_feedlot_country_emissions') }}
