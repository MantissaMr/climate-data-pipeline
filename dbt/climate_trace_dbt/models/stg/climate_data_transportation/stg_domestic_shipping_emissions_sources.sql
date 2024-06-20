
-- Staging model for transportation.domestic_shipping_emissions_sources
SELECT * FROM {{ source('climate_data_transportation', 'domestic_shipping_emissions_sources') }}
