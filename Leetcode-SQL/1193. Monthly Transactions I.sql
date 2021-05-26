-- 問題：用年月和國家分類算出交易有沒有approved的個數和金額
-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.


-- 這題很簡單，就是date_format要用哪一種要查一下，然後記得group by date and country
-- 剩下計算的部分就是用條件判斷
select date_format(trans_date,"%Y-%m") as "month", country, count(*) as "trans_count",
       sum(if(state = "approved", 1, 0)) as "approved_count", sum(amount) as "trans_total_amount", 
       sum(if(state = "approved", amount, 0)) as "approved_total_amount" 
from transactions group by 1,2