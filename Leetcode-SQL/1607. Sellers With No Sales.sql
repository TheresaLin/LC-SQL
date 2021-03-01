-- 問題: (列出2020年沒賣過東西的seller)
-- Write an SQL query to report the names of all sellers who did not make any sales in 2020.
-- Return the result table ordered by seller_name in ascending order.

直接用not in排除掉2020年有賣東西的人
select seller_name from seller s left join orders o on s.seller_id = o.seller_id 
where s.seller_id not in (select distinct seller_id from orders where sale_date > '2020-01-01'and sale_date < '2020-12-31') order by 1