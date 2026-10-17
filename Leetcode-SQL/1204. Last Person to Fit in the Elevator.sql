-- 電梯最多能乘載1000，找出最後一個能坐上這台電梯的人
-- Write an SQL query to find the person_name of the last person who will fit in the elevator without exceeding the weight limit. 
-- It is guaranteed that the person who is first in the queue can fit in the elevator.

-- 虛擬表：以進入電梯的順序，算累積重量
with agg_table as(
    select *,
        sum(weight) over(order by turn) as "agg_weight"
    from queue    
)

-- 排列順序從重量最多至少，如此一來where找出少於1000的第一筆數據會是最後一位進入電梯的人，這時用limit 1取第一位
select person_name
from agg_table
where agg_weight <= 1000
order by agg_weight desc
limit 1