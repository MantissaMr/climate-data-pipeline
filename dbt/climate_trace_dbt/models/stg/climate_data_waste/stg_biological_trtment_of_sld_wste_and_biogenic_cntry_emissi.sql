
-- Staging model for waste.biological_treatment_of_solid_waste_and_biogenic_country_emissi
SELECT * FROM {{ source('climate_data_waste', 'biological_treatment_of_solid_waste_and_biogenic_country_emissi') }}
