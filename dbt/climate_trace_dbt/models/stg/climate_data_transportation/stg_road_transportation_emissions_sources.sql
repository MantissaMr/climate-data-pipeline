
-- Staging model for transportation.road_transportation_emissions_sources
SELECT * FROM {{ source('climate_data_transportation', 'road_transportation_emissions_sources') }}
