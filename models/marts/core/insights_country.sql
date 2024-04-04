<<<<<<< HEAD
with base as (

    select
        Country_Code as country,
        region_classification,
        Category_Title as category,
        Likes,
        comment_count,
        view_count,
        Publishing_Date,
        Trending_Date,
        channel_title
    from {{ ref('model_hypehouse') }}
    
),

aggregated_data as (

    select
        country,
        category,
        region_classification,
        CAST(avg(Likes) AS INT) as avg_likes_per_video,
        CAST(avg(comment_count) AS INT) as avg_comment_per_video,
        CAST(avg(view_count) AS INT) as avg_views_per_video,
        CAST(AVG(DATEDIFF('day', TO_TIMESTAMP(publishing_date, 'YYYY-MM-DD HH24:MI:SS.FF3'), TO_DATE(trending_date, 'YY.DD.MM'))) AS DECIMAL(10,2))as avg_time_to_trend,
        channel_title,
        count(*) as video_count
    from base
    group by country, region_classification, category, channel_title

),

ranked_channels as (

    select
        *,
        row_number() over (
            partition by country, region_classification, category
            order by video_count desc
        ) as rn
    from aggregated_data

)

select
    country,
    region_classification,
    category,
    avg_likes_per_video,
    avg_comment_per_video,
    avg_views_per_video,
    avg_time_to_trend,
    channel_title as most_popular_channel,
    video_count as avg_videos_per_trend_channel
from ranked_channels
where rn = 1

=======
with base as (

    select
        Country_Code as country,
        region_classification,
        Category_Title as category,
        Likes,
        comment_count,
        view_count,
        Publishing_Date,
        Trending_Date,
        channel_title
    from {{ ref('model_hypehouse') }}
    
),

aggregated_data as (

    select
        country,
        category,
        region_classification,
        CAST(avg(Likes) AS INT) as avg_likes_per_video,
        CAST(avg(comment_count) AS INT) as avg_comment_per_video,
        CAST(avg(view_count) AS INT) as avg_views_per_video,
        CAST(AVG(DATEDIFF('day', TO_TIMESTAMP(publishing_date, 'YYYY-MM-DD HH24:MI:SS.FF3'), TO_DATE(trending_date, 'YY.DD.MM'))) AS DECIMAL(10,2))as avg_time_to_trend,
        channel_title,
        count(*) as video_count
    from base
    group by country, region_classification, category, channel_title

),

ranked_channels as (

    select
        *,
        row_number() over (
            partition by country, region_classification, category
            order by video_count desc
        ) as rn
    from aggregated_data

)

select
    country,
    region_classification,
    category,
    avg_likes_per_video,
    avg_comment_per_video,
    avg_views_per_video,
    avg_time_to_trend,
    channel_title as most_popular_channel,
    video_count as avg_videos_per_trend_channel
from ranked_channels
where rn = 1

>>>>>>> 50305adcf5d15c7091a238cbf3e667b9a070e5e4
