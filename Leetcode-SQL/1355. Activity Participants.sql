-- Write an SQL query to find the names of all the activities with neither maximum, nor minimum number of participants.

-- 先算出每個activity有多少人投
-- 去除得到最少票和得到最多票的activity
with A as(
    select activity, count(*) as "num" from friends group by activity
)
select activity from A where num != (select max(num) from A) 
                         and num != (select min(num) from A)