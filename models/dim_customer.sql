WITH customer AS (
    SELECT * FROM {{ source('ECOMM', 'RAW_ECOMMERCE_DATA') }}
    
)

SELECT
    customerid, 
    customername, 
    customercity, 
    customercountry
FROM customer
ORDER BY customerid