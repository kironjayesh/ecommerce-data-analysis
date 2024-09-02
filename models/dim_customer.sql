WITH customer AS (
    SELECT * FROM {{ ref('stg_ecommerce_data') }}
)

SELECT
    customerid, 
    customername, 
    customercity, 
    customercountry
FROM customer
ORDER BY customerid