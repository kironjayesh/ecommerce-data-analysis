WITH product AS (
    SELECT * FROM {{ ref('stg_ecommerce_data') }}
)

SELECT
    productid, 
    productname, 
    productcategory, 
    productsubcategory,
    unitprice 
FROM product
ORDER BY productid