
-- Staging model for transportation.other_transport_country_emissions
SELECT * FROM {{ source('climate_data_transportation', 'other_transport_country_emissions') }}
