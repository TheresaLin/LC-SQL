-- 問題: (列出在num行連續出現三次的num)
-- Write an SQL query to find all numbers that appear at least three times consecutively.

-- sol1: 在subquery查詢num前後的數值用lag()和lead()，lag()查當前列的前筆資料，lead()查當前列的後筆資料
-- 當用lag()和lead()查到的資料都和num本身相同，代表連續出現三次
select distinct num as "ConsecutiveNums" 
from(select id, num, lag(num) over(order by id) as "num_pre", 
                     lead(num) over(order by id) as "num_next" from logs) a 
where a.num = a.num_pre and a.num = a.num_next


-- sol2: use virtual table
with consecutive_table as(
    select lag(num) over(order by id) as PreNum,
           num,
           lead(num) over(order by id) as NextNum
    from Logs
) 

select distinct num as ConsecutiveNums
from consecutive_table
where Prenum = num and num = NextNum


-- sol3: easy one
-- use same table for three times and use distinct and where 
-- ensure id 1,2,3 are the same and three num in these three id are also the same
select distinct l1.num as ConsecutiveNums
from Logs l1, Logs l2, Logs l3
where l1.id - 1 = l2.id and  l2.id - 1 = l3.id and
      l1.num = l2.num and l2.num = l3.num