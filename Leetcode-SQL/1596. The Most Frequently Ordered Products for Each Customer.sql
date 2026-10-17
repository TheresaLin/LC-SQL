-- Write a solution to find the most frequently ordered product(s) for each customer.




-- 第一個virtual table(product_cnt):先算出每個customer買每個product的數量
-- 第二個virtual table(rank_table):根據數量大到小排名
-- 找出rank＝1的

with product_cnt as(
    select customer_id, product_id, count(*) as "cnt"
    from orders
    group by 1, 2
), rank_table as(
    select customer_id, product_id, cnt, rank() over(partition by customer_id order by cnt desc) as "product_rank"
    from product_cnt
)

select customer_id, product_id, product_name
from rank_table join products using(product_id)
where product_rank = 1