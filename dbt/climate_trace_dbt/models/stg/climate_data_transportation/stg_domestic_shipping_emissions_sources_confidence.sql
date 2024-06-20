
-- Staging model for transportation.domestic_shipping_emissions_sources_confidence
SELECT * FROM {{ source('climate_data_transportation', 'domestic_shipping_emissions_sources_confidence') }}
