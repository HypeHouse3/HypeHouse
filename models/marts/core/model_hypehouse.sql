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

likes_count as (

    select * from {{ ref('stg_likes_count') }}

),

final as (

    select 
           comment_count.Country_Code,
           comment_count.region_classification,
           comment_count.Video_ID,
           comment_count.comment_count,
           video_info.Title,
           video_info.description,
           video_info.Publishing_Date,
           video_info.Trending_Date,
           video_info.category_id,
           video_info.Category_Title,
           video_info.channel_title,
           video_info.Comments_Disabled,
           video_info.Tags, 
           video_info.Thumbnail_Link,
           view_count.view_count,
           likes_count.Likes,
           likes_count.File_Date
           
           
    from comment_count

              
        left join video_info on comment_count.Video_ID = video_info.Video_ID AND comment_count.File_Date = video_info.File_Date AND comment_count.Country_Code = video_info.Country_Code
       
        left join view_count on comment_count.Video_ID = view_count.Video_ID AND comment_count.File_Date = view_count.File_Date AND comment_count.Country_Code = view_count.Country_Code

        left join likes_count on comment_count.Video_ID = likes_count.Video_Id AND comment_count.File_Date = likes_count.File_Date AND comment_count.Country_Code = likes_count.Country_Code
       
)

select * from final
