{% macro get_season(x) %}
CASE WHEN MONTH(TO_TIMESTAMP({{x}})) in (12,1,2) THEN 'WINTER'
     WHEN MONTH(TO_TIMESTAMP({{x}})) in (3,4,5) THEN  'SPRING'
     WHEN MONTH(TO_TIMESTAMP({{x}})) in (6,7,8) THEN  'SUMMER'
     WHEN MONTH(TO_TIMESTAMP({{x}})) in (9,10,11) THEN 'AUTUMN'
     END
{% endmacro %}

{% macro day_type(x) %}
CASE WHEN DAYNAME(TO_TIMESTAMP({{x}})) in ('SAT','SUN') THEN 'WEEKEND'
ELSE 'BUSINESSDAY' END
{% endmacro %}