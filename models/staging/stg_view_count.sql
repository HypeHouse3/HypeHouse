with view_count as (

SELECT

  value:video_id_for_client_HyPeHoUsE::string as Video_ID,
  value:view_count_for_client_HyPeHoUsE::string as View_Count,
  value:country_code::string as Country_Code,
  CASE 
    WHEN value:country_code::string IN ({{ "'" + "', '".join(var('country_classification')['European']) + "'" }}) THEN 'European'
    WHEN value:country_code::string IN ({{ "'" + "', '".join(var('country_classification')['Non-European']) + "'" }}) THEN 'Non-European'
    ELSE 'Unknown'
  END AS region_classification,
  File_Date
  FROM
    {{ source('original', 'view_count') }}
  , LATERAL FLATTEN(INPUT => name:data)

)

select * from view_count

