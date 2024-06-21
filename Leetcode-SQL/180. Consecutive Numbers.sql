-- 問題: (列出在num行連續出現三次的num)
-- Write an SQL query to find all numbers that appear at least three times consecutively.

-- 在subquery查詢num前後的數值用lag()和lead()，lag()查當前列的前筆資料，lead()查當前列的後筆資料
-- 當用lag()和lead()查到的資料都和num本身相同，代表連續出現三次
select distinct num as "ConsecutiveNums" 
from(select id, num, lag(num) over(order by id) as "num_pre", 
                     lead(num) over(order by id) as "num_next" from logs) a 
where a.num = a.num_pre and a.num = a.num_next


-- use virtual table
with consecutive_table as(
    select lag(num) over(order by id) as PreNum,
           num,
           lead(num) over(order by id) as NextNum
    from Logs
) 

select distinct num as ConsecutiveNums
from consecutive_table
where Prenum = num and num = NextNum