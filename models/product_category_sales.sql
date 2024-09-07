with sales as (
    select
        productcategory, 
        totalamount
    from stg_ecommerce_data
)

SELECT
    productcategory, 
    SUM(totalamount) as total_sales_amount
FROM sales
GROUP BY productcategory