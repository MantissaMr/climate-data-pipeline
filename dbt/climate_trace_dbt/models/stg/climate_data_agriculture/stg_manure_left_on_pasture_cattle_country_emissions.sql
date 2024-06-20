
-- Staging model for agriculture.manure_left_on_pasture_cattle_country_emissions
SELECT * FROM {{ source('climate_data_agriculture', 'manure_left_on_pasture_cattle_country_emissions') }}
