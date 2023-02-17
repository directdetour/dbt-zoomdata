{{ config(materialized='view') }}


SELECT 
cast(int64_field_0 as integer) as tripid, 
dispatching_base_num, 
cast(pickup_datetime as timestamp) as pickup_datetime, 
cast(dropoff_datetime as timestamp) as dropoff_datetime, 
cast(PULocationID as integer) as pickup_locationid, 
cast(DOLocationID as integer) as dropoff_locationid, 
SR_Flag, 
Affiliated_base_number 
from {{ source('staging','fhv_tripdata') }}


-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}