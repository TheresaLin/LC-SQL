-- Write an SQL query to find the average number of sessions per user for a period of 30 days ending 2019-07-27 inclusively, rounded to 2 decimal places. 
-- The sessions we want to count for a user are those with at least one activity in that time period.
-- 有日期區間的要注意，因為這題有點奸詐，用datediff時間間格得調好，建議用between

-- 兩層select效率比較高
select ifnull(round(avg(coun_se),2),0) "average_sessions_per_user" 
    from(select count(distinct session_id)/count(distinct user_id) "coun_se" 
            from activity where datediff('2019-07-27',activity_date) < 30 group by user_id) A

-- 單個select時間複雜度會比較高
select ifnull(round(count(distinct session_id)/count(distinct user_id),2),0) "average_sessions_per_user" 
    from activity where activity_date >= '2019-06-28' and activity_date <= '2019-07-27'