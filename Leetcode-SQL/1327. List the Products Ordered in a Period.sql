-- 問題: Write an SQL query to get the names of products with greater than or equal to 100 units ordered in February 2020 and their amount.
-- 分組後用having設>=100
select product_name, sum(unit) "unit" 
from orders o join products p on o.product_id = p.product_id 
where order_date between '2020-02-01' and '2020-02-29' 
group by 1 having unit >= 100
