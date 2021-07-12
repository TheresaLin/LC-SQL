-- 找user近期第二近參加的活動
-- Write an SQL query to show the second most recent activity of each user.

-- Ａ表根據每位user近期活動依時間做排序
-- Ｂ表針對沒有第二近活動的玩家把第一名的活動也取為第二名
with A as(
    select username, 
           rank() over(partition by username order by startDate desc) as "recent_activity_rnk", 
           activity, startDate, endDate 
    from useractivity
    ), B as(
  (select username, recent_activity_rnk, activity, startDate, endDate from A)
  union all
  (select username, "2" as recent_activity_rnk, activity, startDate, endDate from A 
   where username in (select username from A group by 1 
                      having sum(recent_activity_rnk) < 3))
        )

-- 最後搜第二名的活動
select username, activity, startDate, endDate from B where recent_activity_rnk = 2