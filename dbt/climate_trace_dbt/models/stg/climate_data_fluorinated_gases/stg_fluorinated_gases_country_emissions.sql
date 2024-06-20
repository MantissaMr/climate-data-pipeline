
-- Staging model for fluorinated_gases.fluorinated_gases_country_emissions
SELECT * FROM {{ source('climate_data_fluorinated_gases', 'fluorinated_gases_country_emissions') }}
