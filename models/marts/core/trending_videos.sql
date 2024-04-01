with trending_videos as 

(SELECT Country_Code, region_classification, channel_title, COUNT(*) AS num_trending_videos
FROM {{ ref('model_hypehouse') }}
GROUP BY Country_Code, region_classification, Channel_Title
)

select * from trending_videos