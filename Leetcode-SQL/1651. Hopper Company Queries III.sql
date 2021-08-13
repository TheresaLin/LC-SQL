-- 1-10月列出當月以及後兩個月數據加總後的平均距離和平均時間
-- Write an SQL query to compute the average_ride_distance and average_ride_duration of 
-- every 3-month window starting from January - March 2020 to October - December 2020. 
-- Round average_ride_distance and average_ride_duration to the nearest two decimal places.

-- 這題有點小複雜，參考184題
-- Ａ表用遞歸列出1-12月
with recursive A as(
    select 1 as "month"
    union all
    select month+1
    from A
    where month<12
), B as(
-- 限縮數據在2020年期間   
    select month(requested_at) as "month", ride_distance, ride_duration
    from AcceptedRides AR join rides R on AR.ride_id = R.ride_id 
    where year(requested_at) = 2020 
), C as(
-- 把Ａ、Ｂ表結合，沒有數據的月份強迫為0
-- 此動作是把1-12月份的數據都搜集好
    select A.month, 
           sum(ifnull(ride_distance, 0)) as " total_ride_distance", 
           sum(ifnull(ride_duration, 0)) as "total_ride_duration" 
    from A left join B on A.month = B.month group by 1
), D as(
-- 使用sum() over(order by月份 rows between 當前欄及後兩欄)來加總當月以及後兩個月數據
    select month, 
           round(sum(total_ride_distance) over(order by month rows between current row and 2 following)/3, 2) as "average_ride_distance",
           round(sum(total_ride_duration) over(order by month rows between current row and 2 following)/3, 2) as "average_ride_duration"
    from C
    group by 1
)
-- 只需要1-10月的數據
select * from D where month <= 10

