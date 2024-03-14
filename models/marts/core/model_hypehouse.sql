with 

comment_count as (

    select * from {{ ref('stg_comment_count') }}

),


video_info as (

    select * from {{ ref('stg_video_info') }}

),

view_count as (

    select * from {{ ref('stg_view_count') }}

),

final as (

    select 
           comment_count.Video_ID,
           comment_count.comment_count,
           video_info.Title,
           video_info.description,
           video_info.Publishing_Date,
           video_info.Trending_Date,
           video_info.category_id,
           video_info.Category_Title,
           video_info.channel_title,
           video_info.Tags, 
           video_info.Thumbnail_Link,
           view_count.view_count
           
           
    from comment_count

              
        left join video_info on comment_count.Video_ID = video_info.Video_ID
       
        left join view_count on comment_count.Video_ID = view_count.Video_ID
       
)

select * from final