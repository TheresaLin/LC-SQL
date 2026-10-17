-- 列出同時買Ａ、Ｂ卻沒買Ｃ的人
-- Write an SQL query to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.


-- 思路是用where in把有買Ａ的客戶搜出來，再把有買Ｂ的客戶列出，並排除有買Ｃ的客戶
select distinct customer_id, customer_name
from Customers
where customer_id in
(
    select customer_id
    from Orders
    where product_name='A'
) and customer_id in
(
    select customer_id
    from Orders
    where product_name='B'
) and customer_id not in
(
    select customer_id
    from Orders
    where product_name='C'
) 

-- easier function:
SELECT c.customer_id, customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(product_name='A') > 0
    AND SUM(product_name='B') > 0
    AND SUM(product_name='C') = 0
ORDER BY c.customer_id;