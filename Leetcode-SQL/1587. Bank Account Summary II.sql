-- 問題: 搜尋帳戶中超過10000的人
-- Write an SQL query to report the name and balance of users with a balance higher than 10000. 
-- The balance of an account is equal to the sum of the amounts of all transactions involving that account.

-- 這題一定要用having代表group by後再來算值
select name, sum(amount) as "balance" 
from users u join transactions t on u.account = t.account group by 1
having sum(amount) > 10000