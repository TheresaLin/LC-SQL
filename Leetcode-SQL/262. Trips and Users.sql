-- 問題: (算出每天的request取消率，被banned的人直接不算ignore)
-- Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) 
-- each day between "2013-10-01" and "2013-10-03".


-- 用case when把沒被banned、但是取消的人當分子，沒被banned的當分母
select request_at as "day", 
       round(1-(sum(case when u.banned = 'No' and u2.banned = 'No' and status = 'completed' then 1 else 0 end)/
                sum(case when u.banned = 'No' and u2.banned = 'No' then 1 else 0 end)),2) as "Cancellation Rate" 
from trips t join users u on t.client_id = u.users_id join users u2 on t.driver_id =u2.users_id 
where request_at between '2013-10-01' and '2013-10-03' group by request_at 