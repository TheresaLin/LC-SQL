-- 問題: 找買S8但沒買iPhone的買家
-- Write an SQL query that reports the buyers who have bought S8 but not iPhone. 

-- 思路: 只要有買過iPhone的買家就不行，所以用 where buyer_ID not in(select )替除掉有買過iPhone的人
select distinct buyer_id from sales s join product p on s.product_id = p.product_id 
    where buyer_ID not in(select buyer_id from sales s1 join product p1 on s1.product_id = p1.product_id 
                            where product_name = "iPhone") and product_name = "S8"


-- 錯誤但只差一點點了 就是裡面的select不需要再group by
select buyer_id from sales s join product p on s.product_id = p.product_id 
    where buyer_ID not in(select buyer_id from sales s1 join product p1 on s1.product_id = p1.product_id 
                            where product_name = "iPhone" group by buyer_id) and product_name = "S8"