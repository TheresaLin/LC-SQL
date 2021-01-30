-- 問題: Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
-- A user was active on some day if he/she made at least one activity on that day.
-- between 是時間複雜度最小的 相對其他兩個答案
Select activity_date "day", count(distinct user_id) "active_users" 
    from activity where activity_date between '2019-06-28' and '2019-07-27' 
    group by activity_date 


-- 另種用datediff('****-**-**',日期欄位名) < 30
Select activity_date "day", count(distinct user_id) "active_users" 
    from activity where datediff('2019-07-27',activity_date) < 30
    group by activity_date

-- 不知為何 <= 29比 <30 快很多
Select activity_date "day", count(distinct user_id) "active_users" 
    from activity where datediff('2019-07-27',activity_date) <= 29
    group by activity_date

    