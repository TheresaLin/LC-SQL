-- 找出每項產品最近的一筆訂單(同日期有多筆就要列出來)
-- Write an SQL query to find the most recent order(s) of each product.


-- rnk為每個商品購買時間的近到遠做排名
with A as(
    select product_name, o.product_id, order_id, order_date, 
           rank() over(partition by o.product_id order by order_date desc) as "rnk" 
    from orders o join products p on o.product_id = p.product_id
    )
-- 列出rnk=1購賣時間最近的所有資料
select product_name, product_id, order_id, order_date 
from A 
where rnk = 1 order by 1, 2, 3