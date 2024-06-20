
-- Staging model for agriculture.enteric_fermentation_other_country_emissions
SELECT * FROM {{ source('climate_data_agriculture', 'enteric_fermentation_other_country_emissions') }}
