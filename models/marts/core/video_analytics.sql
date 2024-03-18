SELECT
    video_info.Video_ID,
    video_info.Title,
    CATEGORY_TITLE,
    AVG(VIEW_COUNT) AS avg_view_count,
    SUM(VIEW_COUNT) AS total_view_count,
    file_date
FROM {{ source('gery_dev', 'model_hypehouse') }}
GROUP BY VIDEO_ID, file_date, CATEGORY_TITLE
