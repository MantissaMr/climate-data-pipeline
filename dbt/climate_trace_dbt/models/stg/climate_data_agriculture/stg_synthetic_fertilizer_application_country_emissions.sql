
-- Staging model for agriculture.synthetic_fertilizer_application_country_emissions
SELECT * FROM {{ source('climate_data_agriculture', 'synthetic_fertilizer_application_country_emissions') }}
