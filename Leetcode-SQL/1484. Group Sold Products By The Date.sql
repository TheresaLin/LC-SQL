-- 問題: Write an SQL query to find for each date, the number of distinct products sold and their names.
-- 用group_concat()解決分組放同一欄的問題
select sell_date, count(distinct product) "num_sold", group_concat(distinct product order by product) "products" 
from activities group by 1

