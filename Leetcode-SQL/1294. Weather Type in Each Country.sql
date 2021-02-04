-- 問題: (以2019年11月平均溫度來衡量weather type)
-- Write an SQL query to find the type of weather in each country for November 2019.

-- 雙重case 
select country_name, case when avg(weather_state)<=15 then 'Cold' 
                          when avg(weather_state)>=25 then 'Hot' 
                          else 'Warm' end "weather_type" 
from weather w join countries c on w.country_id=c.country_id 
where day between '2019-11-01' and '2019-11-30' group by 1