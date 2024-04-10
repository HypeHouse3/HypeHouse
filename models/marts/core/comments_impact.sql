WITH comment_stats AS (
    SELECT
        CASE WHEN comments_disabled = 'true' THEN 'Disabled' ELSE 'Enabled' END AS comment_status,
        AVG(view_count) AS avg_view_count,
        AVG(Likes) AS avg_like_count
    FROM
        {{ ref('model_hypehouse') }}
    GROUP BY
        comment_status
)

SELECT
    comment_status,
    ROUND(avg_view_count, 2) AS avg_view_count,
    ROUND(avg_like_count, 2) AS avg_like_count
FROM
    comment_stats
