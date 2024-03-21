with view_count as (

SELECT

  value:video_id_for_client_HyPeHoUsE::string as Video_ID,
  value:view_count_for_client_HyPeHoUsE::string as View_Count,
  value:country_code::string as Country_Code,
  File_Date
  FROM
    {{ source('original', 'view_count') }}
  , LATERAL FLATTEN(INPUT => name:data)

)

select * from view_count

