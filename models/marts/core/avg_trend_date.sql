WITH avg_trend_date AS (
    SELECT Country_Code, region_classification, CAST(AVG(DATEDIFF('day', TO_TIMESTAMP(publishing_date, 'YYYY-MM-DD HH24:MI:SS.FF3'), TO_DATE(trending_date, 'YY.DD.MM'))) AS DECIMAL(10,2))
    FROM {{ ref('model_hypehouse') }}
    GROUP BY Country_Code, region_classification
)

SELECT * FROM avg_trend_date
