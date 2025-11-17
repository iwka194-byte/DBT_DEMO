with BIKE AS (
Select 
	RIDE_ID ,
	REPLACE(STARTED_AT,'"','') as STARTED_AT,
	REPLACE(ENDED_AT ,'"','') as ENDED_AT,
	START_STATION_NAME ,
	START_STATIO_ID ,
	END_STATION_NAME ,
	END_STATION_ID ,
	START_LAT ,
	START_LNG ,
	END_LAT ,
	END_LNG ,
	MEMBER_CSUAL
    from {{ source('demo', 'bike') }}
    where RIDE_ID <> '"bikeid"' and STARTED_AT <> '"starttime"' and STARTED_AT <> 'starttime'

)

select *
from
BIKE