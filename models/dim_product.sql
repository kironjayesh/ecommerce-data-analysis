WITH product AS (
    SELECT * FROM {{ source('ECOMM', 'RAW_ECOMMERCE_DATA') }}
)

SELECT
    productid, 
    productname, 
    productcategory, 
    productsubcategory,
    unitprice 
FROM product
ORDER BY productid