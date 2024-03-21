with likes_count as (
    SELECT
  value:likes_for_client_HyPeHoUsE::number as Likes,
  value:video_id_for_client_HyPeHoUsE::string as Video_Id,
  value:country_code::string as Country_Code,
  File_Date
  FROM
    {{ source('original', 'likes_count') }}
  , LATERAL FLATTEN(INPUT => name:data)
)

select * from likes_count