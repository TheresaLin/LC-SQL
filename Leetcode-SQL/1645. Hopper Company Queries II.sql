-- 這題主要是算1635題得出來的 accepted_rides/active_drivers
-- Write an SQL query to report the percentage of working drivers (working_percentage) for each month of 2020 where:

-- 這題和1635題最不一樣的是：這題的Ｃ表count(distinct driver_id)需要去除重複值
with recursive A as(
    select 1 as "month"
    union all
    select month+1
    from A
    where month<12
), B as(
    select month(join_date) as "month", 
           count(driver_id) over(order by join_date) as "active_drivers" 
    from drivers 
    where year(join_date) <= 2020

), C as(
    select month(requested_at) as "month", 
           count(distinct driver_id) as "accepted_rides" 
    from AcceptedRides AR join rides R on AR.ride_id = R.ride_id 
    where year(requested_at) = 2020 
    group by 1
)
-- 最後accepted_rides/active_drivers
select distinct A.month, 
       round(ifnull(accepted_rides /
                    max(active_drivers) over(order by A.month), 0) * 100, 2) as "working_percentage" 
from A left join B on A.month = B.month left join C on A.month = C.month