with trending_videos as 

(SELECT channel_title, COUNT(*) AS num_trending_videos
FROM {{ ref('model_hypehouse') }}
GROUP BY Channel_Title
)

select * from trending_videos