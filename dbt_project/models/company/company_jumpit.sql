{{ config(materialized = 'view') }}

WITH company_table AS (
    SELECT DISTINCT company_id, company_name
    FROM {{ source('crawling_data', 'jumpit') }}
)
SELECT CONCAT('https://www.jumpit.co.kr', company_id) AS company_url, company_name
FROM company_table
