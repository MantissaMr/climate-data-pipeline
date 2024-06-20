
-- Staging model for agriculture.other_agricultural_soil_emissions_country_emissions
SELECT * FROM {{ source('climate_data_agriculture', 'other_agricultural_soil_emissions_country_emissions') }}
