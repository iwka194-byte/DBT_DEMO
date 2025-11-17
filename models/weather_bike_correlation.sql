with cte as (
    select
    t.*,
    w.*
    from {{ ref('trip_fact') }} t
    left join {{ ref('daily_weather') }} w
    on t.TRIP_DATE=w.DAILY_WEATHER
)

select * 
from cte