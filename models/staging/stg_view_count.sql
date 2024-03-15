with view_count as (

SELECT

  value:video_id_for_client_HyPeHoUsE::string as Video_ID,
  value:view_count_for_client_HyPeHoUsE::string as View_Count,
  File_Date
  FROM
    {{ source('original', 'view_count') }}
  , LATERAL FLATTEN(INPUT => name:data)

)

select * from view_count

