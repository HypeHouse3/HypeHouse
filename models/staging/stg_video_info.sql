with video_info as (

  select

    value:categoryId_for_client_HyPeHoUsE::number AS Category_ID,
    CASE value:categoryId_for_client_HyPeHoUsE::number
      WHEN 1 THEN 'Film & Animation'
      WHEN 2 THEN 'Autos & Vehicles'
      WHEN 10 THEN 'Music'
      WHEN 15 THEN 'Pets & Animals'
      WHEN 17 THEN 'Sports'
      WHEN 18 THEN 'Short Movies'
      WHEN 19 THEN 'Travel & Events'
      WHEN 20 THEN 'Gaming'
      WHEN 21 THEN 'Videoblogging'
      WHEN 22 THEN 'People & Blogs'
      WHEN 23 THEN 'Comedy'
      WHEN 24 THEN 'Entertainment'
      WHEN 25 THEN 'News & Politics'
      WHEN 26 THEN 'Howto & Style'
      WHEN 27 THEN 'Education'
      WHEN 28 THEN 'Science & Technology'
      WHEN 29 THEN 'Nonprofits & Activism'
      WHEN 30 THEN 'Movies'
      WHEN 31 THEN 'Anime/Animation'
      WHEN 32 THEN 'Action/Adventure'
      WHEN 33 THEN 'Classics'
      WHEN 34 THEN 'Comedy'
      WHEN 35 THEN 'Documentary'
      WHEN 36 THEN 'Drama'
      WHEN 37 THEN 'Family'
      WHEN 38 THEN 'Foreign'
      WHEN 39 THEN 'Horror'
      WHEN 40 THEN 'Sci-Fi/Fantasy'
      WHEN 41 THEN 'Thriller'
      WHEN 42 THEN 'Shorts'
      WHEN 43 THEN 'Shows'
      WHEN 44 THEN 'Trailers'
    END AS Category_Title,
    value:channelId_for_client_HyPeHoUsE::string AS Channel_ID,
    value:channelTitle_for_client_HyPeHoUsE::string AS Channel_Title,
    value:comments_disabled_for_client_HyPeHoUsE::string AS Comments_Disabled,
    value:description_for_client_HyPeHoUsE::string AS Description,
    TO_CHAR(TO_TIMESTAMP(value:publishedAt_for_client_HyPeHoUsE::string), 'YYYY-MM-DD HH24:MI:SS.FF3') AS Publishing_Date,
    value:ratings_disabled_for_client_HyPeHoUsE::string AS Ratings_Disabled,
    value:tags_for_client_HyPeHoUsE::string AS Tags,
    value:thumbnail_link_for_client_HyPeHoUsE::string AS Thumbnail_Link,
    value:title_for_client_HyPeHoUsE::string AS Title,
    value:trending_date_for_client_HyPeHoUsE::string AS Trending_Date,
    value:video_id_for_client_HyPeHoUsE::string AS Video_ID,  
    value:country_code::string as Country_Code,
    File_Date
  from
    {{ source('original', 'video_info') }},
  LATERAL FLATTEN(INPUT => name:data)
)

select * from video_info


