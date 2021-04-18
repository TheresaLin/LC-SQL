-- 問題: (算機率 分子:第一天使用後隔天繼續使用的玩家/分母:所有玩家)

-- Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. 
-- In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

-- 先算每個使用者的第一天，用min(event_date)
-- 分子:case when 搜同一使用者，event_date - first_date = 1 
-- 分母:count(所有不同的player)

select round(sum(case when A.player_id = activity.player_id and event_date - first_date = 1 then 1 else 0 end)/
            (select count(distinct player_id) from activity),2) as "fraction" 
from (select player_id, min(event_date) as "first_date" from activity group by 1) A, activity
