-- 問題：（列出有買全部商品的客戶）Write an SQL query for a report that provides the customer ids 
-- from the Customer table that bought all the products in the Product table.


-- 注意Customer Table裡面有重複的數據
-- sum_prod是如果此customer買的product有在Product Table裡面都算1，總數如果等於Product Table所有的product_key加總就是要查詢的人了！
select customer_id from (select customer_id, 
                                sum(if(product_key in (select product_key from product),1 ,0)) as  "sum_prod" 
                         from (select distinct customer_id, product_key from customer) A group by 1 
                         having sum_prod = (select count(distinct product_key) as "sum_prod" from product)) B

-- 比較簡單的想法，但是運算比較久
-- 直接算Customer Table裡的product_key總數是否等於Product Table的
select customer_id from customer group by 1 
having count(distinct product_key) = (select count(product_key) from product)