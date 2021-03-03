-- 問題: (查詢每個contest中的比例)
-- Write an SQL query to find the percentage of the users registered in each contest rounded to two decimals.
-- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

-- 在percentage的分母要在subquery算出總共有多少user
select contest_id, round(100*count(r.user_id)/(select count(*) from users),2) as "percentage" 
from register r join users u on r.user_id = u.user_id 
group by 1 order by 2 desc, 1 asc