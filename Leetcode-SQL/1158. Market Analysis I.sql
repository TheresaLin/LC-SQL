-- 問題：列出所有user在2019年買了幾個產品
-- Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.

-- 技巧就是在order_date在2019年建立的為1，其餘為0根據每個user加總起來即可
select user_id as "buyer_id", join_date, sum(if(order_date>"2018-12-31",1,0)) as "orders_in_2019" 
from users u left join orders o on u.user_id = o.buyer_id group by 1