with bike as (
select distinct
START_STATIO_ID as station_id,
START_STATION_NAME as station_name,
START_LAT as station_lat,
START_LNG as station_lng
from {{ source('demo', 'bike') }}
where RIDE_ID <> 'ride_id'
)

select * 
from bike