with view_count as (

SELECT

  value:video_id_for_client_HyPeHoUsE::string as Video_ID,
  value:view_count_for_client_HyPeHoUsE::string as View_Count,
  value:country_code::string as Country_Code,
<<<<<<< HEAD
  CASE
      WHEN country_code IN ({{ var('country_classification')['European'] | join: "', '" }}) THEN 'European'
      WHEN country_code IN ({{ var('country_classification')['Non-European'] | join: "', '" }}) THEN 'Non-European'
=======
  CASE 
    WHEN value:country_code::string IN ({{ "'" + "', '".join(var('country_classification')['European']) + "'" }}) THEN 'European'
    WHEN value:country_code::string IN ({{ "'" + "', '".join(var('country_classification')['Non-European']) + "'" }}) THEN 'Non-European'
    ELSE 'Unknown'
>>>>>>> 50305adcf5d15c7091a238cbf3e667b9a070e5e4
  END AS region_classification,
  File_Date
  FROM
    {{ source('original', 'view_count') }}
  , LATERAL FLATTEN(INPUT => name:data)

)

select * from view_count

