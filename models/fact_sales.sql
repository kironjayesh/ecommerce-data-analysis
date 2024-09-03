WITH customer_dim as (
    SELECT  
        customerid, 
        customername, 
        customercity, 
        customercountry
    FROM {{ ref('dim_customer') }}
), 

    date_dim as (
        SELECT  
            date, 
            DayOfWeek, 
            Month, 
            Year
        FROM {{ ref('dim_date') }}
    ), 

    sales_data as (
        SELECT
            s.transactionid, 
            s.customerid,
            s.customername,
            s.date, 
            SUM(s.totalamount) as total_sales_amount
        FROM {{ ref('stg_ecommerce_data') }} s
        GROUP BY 
            s.transactionid,  
            s.customerid,
            s.customername,
            s.date
    )

SELECT 
    sd.transactionid, 
    cd.customerid,
    cd.customername,
    dd.date,
    sd.total_sales_amount
FROM sales_data as sd
JOIN customer_dim cd ON sd.customerid = cd.customerid
JOIN date_dim dd ON sd.date = dd.date