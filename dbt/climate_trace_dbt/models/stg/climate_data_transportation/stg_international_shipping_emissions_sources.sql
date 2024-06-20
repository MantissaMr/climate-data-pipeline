
-- Staging model for transportation.international_shipping_emissions_sources
SELECT * FROM {{ source('climate_data_transportation', 'international_shipping_emissions_sources') }}
