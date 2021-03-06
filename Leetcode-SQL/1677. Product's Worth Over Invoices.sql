-- 問題: (根據name分組，反正很簡單，反正很簡單就對了)
-- Write an SQL query that will, for all products, return each product name with total amount due, paid, canceled, and refunded across all invoices.

select name, sum(rest) as "rest", sum(paid) as "paid", sum(canceled) as "canceled", sum(refunded) as "refunded" 
from invoice i join product p on i.product_id = p.product_id group by 1 order by 1
