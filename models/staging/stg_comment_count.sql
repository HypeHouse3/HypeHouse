with comment_count as (
    
SELECT

  value:comment_count_for_client_HyPeHoUsE::string as Comment_Count,
  value:video_id_for_client_HyPeHoUsE::string as Video_ID,
  value:country_code::string as Country_Code,
  File_Date 
  FROM
    {{ source('original', 'comment_count') }}
  , LATERAL FLATTEN(INPUT => name:data)

)

select * from comment_count 

