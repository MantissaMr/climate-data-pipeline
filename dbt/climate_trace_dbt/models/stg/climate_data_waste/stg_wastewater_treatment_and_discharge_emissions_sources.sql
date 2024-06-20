
-- Staging model for waste.wastewater_treatment_and_discharge_emissions_sources
SELECT * FROM {{ source('climate_data_waste', 'wastewater_treatment_and_discharge_emissions_sources') }}
