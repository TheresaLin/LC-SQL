-- 問題：列出business_id有多於一個event的occurences超過該事件的平均發生次數
-- Write an SQL query to find all active businesses.
-- An active business is a business that has more than one event type with occurences greater than the average occurences of that event type among all businesses


-- 首先虛擬表Ａ把每個事件的平均發生次數算出來
with A as(select event_type, avg(occurences) as "avg_occur" from events group by 1)

-- 列出發生次數大於平均且有大於一個事件以上的business_id
select business_id from A join events e on A.event_type = e.event_type 
where occurences > avg_occur group by 1 having count(*)>1
