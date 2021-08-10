-- 這題要算當前累績的生效駕駛人數和當月接受載客的次數
-- Write an SQL query to report the following statistics for each month of 2020:
-- (1) The number of drivers currently with the Hopper company by the end of the month (active_drivers).
-- (2) The number of accepted rides in that month (accepted_rides).

-- 表Ａ：首先使用recursive table列出1到12月
with recursive A as(
    select 1 as "month"
    union all
    select month+1
    from A
    where month<12
), B as(
-- 表Ｂ：生效的駕駛不只要算當月的還有之前所有的生效駕駛
-- 所以count() over(order by 加入時間)，就會根據時間累加上去，where 時間2020年或以前
    select month(join_date) as "month", 
           count(driver_id) over(order by join_date) as "active_drivers" 
    from drivers 
    where year(join_date) <= 2020

), C as(
-- 表Ｃ：每個月的載客的次數，此時就要用group by 月份了
-- where 時間2020年
    select month(requested_at) as "month", 
           count(*) as "accepted_rides" 
    from AcceptedRides AR join rides R on AR.ride_id = R.ride_id 
    where year(requested_at) = 2020 
    group by 1
)
-- 最後以表Ａ left join其他兩個表
-- 當月沒有active_drivers的就要拿上個月次數，所以使用max(active_drivers) over(order by A.month)
select distinct A.month, 
       ifnull(max(active_drivers) over(order by A.month), 0) as "active_drivers", 
       ifnull(accepted_rides, 0) as "accepted_rides" 
from A left join B on A.month = B.month left join C on A.month = C.month
