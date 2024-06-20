
-- Staging model for waste.incineration_and_open_burning_of_waste_country_emissions
SELECT * FROM {{ source('climate_data_waste', 'incineration_and_open_burning_of_waste_country_emissions') }}
