-- 問題：找出有每天移除spam的平均機率
-- Write an SQL query to find the average for daily percentage of posts that got removed after being reported as spam, rounded to 2 decimal places.


-- 虛擬表Ａ表示的是每天spam有被post的個數
with A as(
    select action_date, count(distinct post_id) as "spam_num" from actions 
    where action='report' and extra = "spam" group by 1
), 
-- 虛擬表Ｂ記錄沒被removed掉的post個數
B as(
    select action_date, count(distinct post_id) as "spam_num" from actions 
    where extra = "spam" and post_id not in (select post_id from removals) group by 1
)

-- A表 left join B表(因為可能會有些天的spam都被移除掉了，那天的spam就會為空，必須用left join把所有有spam過的日期都搜出來)
-- 每天的移除率＝該天sapm的總數-該天沒被移除的spam個數/該天sapm的總數((A.spam_num-B.spam_num)/A.spam_num)。
-- 若B的spam_num為空，代表該天的spam都被移除掉了，移除率為100%(A.spam_num/A.spam_num)
select round(avg(if(B.spam_num is Null, A.spam_num,A.spam_num-B.spam_num)/A.spam_num)*100,2) as "average_daily_percent"  
from A left join B on A.action_date = B.action_date