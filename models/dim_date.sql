WITH 
    dates AS (
        SELECT * FROM {{ source('ECOMM', 'RAW_ECOMMERCE_DATA') }}
    ),
    
    distinct_dates AS (
        SELECT DISTINCT date
        FROM dates
    )

SELECT 
    DISTINCT date as date, 
    EXTRACT(YEAR from date) AS Year,
    EXTRACT(MONTH from date) AS Month,
    DAYOFWEEK(date) as DayOfWeek, 
    EXTRACT(QUARTER from date) AS Quarter,
    CASE WHEN DAYOFWEEK(date) IN (0, 6) THEN TRUE ELSE FALSE END AS IsWeekend
FROM distinct_dates
ORDER BY date
