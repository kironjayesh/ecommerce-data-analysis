WITH ecommerce_data AS (
    SELECT * FROM {{ source('ECOMM', 'RAW_ECOMMERCE_DATA') }}
)

SELECT * FROM ecommerce_data
