-- 問題: 找每月超過20元的訂單有多少張，有多少不同的顧客
-- Write an SQL query to find the number of unique orders 
-- and the number of unique customers with invoices > $20 for each different month.
-- Return the result table sorted in any order.

-- 不難，為一要注意是date_format，也可以使用substring(欄位,從第幾個開始,到第幾位)
select date_format(order_date, '%Y-%m') as "month", count(*) as "order_count", count(distinct customer_id) as "customer_count" 
from orders where invoice>20 group by 1 

-- substring()的作法
select substring(order_date, 1, 7) as "month", count(*) as "order_count", count(distinct customer_id) as "customer_count" 
from orders where invoice>20 group by 1 