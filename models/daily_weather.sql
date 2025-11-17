with daily_weather as (
select    
DATE(TIME) as DAILY_WEATHER,
WEATHER,
TEMP,
PRESSURE,
HUMIDITY,
CLOUDS
from {{ source('demo', 'weather') }}   
),

daily_weather_agg as (
select 
DAILY_WEATHER,
WEATHER,
ROUND(AVG(TEMP),2) as AVG_TEMP,
ROUND(AVG(PRESSURE),2) as AVG_PRESSURE,
ROUND(AVG(HUMIDITY),2) as AVG_HUMIDITY,
ROUND(AVG(CLOUDS),2) as AVG_CLOUDS
from daily_weather
group by 
DAILY_WEATHER,
WEATHER
qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(WEATHER) desc) =1
)

select * from daily_weather_agg