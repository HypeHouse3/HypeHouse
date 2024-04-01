with avg_views_category as (
SELECT Country_Code, region_classification, category_Id, category_title, CAST(AVG(view_count) AS INT) AS average_view_count
FROM {{ ref('model_hypehouse') }}
GROUP BY Country_Code, region_classification, category_Id, category_title
)
select * from avg_views_category
