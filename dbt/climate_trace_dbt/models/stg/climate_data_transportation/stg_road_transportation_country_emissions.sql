
-- Staging model for transportation.road_transportation_country_emissions
SELECT * FROM {{ source('climate_data_transportation', 'road_transportation_country_emissions') }}
