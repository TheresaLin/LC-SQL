-- 問題：每個商品在2018-08-16之前的最後定價是多少，Null一率為10元
-- Write an SQL query to find the prices of all products on 2019-08-16. 
-- Assume the price of all products before any change is 10.


-- 虛擬表Ａ：根據product_id分組，排列出2018-08-16之前的時間由近期至早期
with A as(
    select product_id, new_price, 
           row_number() over(partition by product_id order by change_date desc) as "last_date_order" 
    from products where change_date <= "2019-08-16"
), B as(
-- 虛擬表Ｂ：列出所有product_id，這步是為了left join另個有些product_id沒有出現的表，確保所有product_id都有出現
    select distinct product_id from products 
), C as(
-- 虛擬表Ｃ：從Ａ表中選出最新的價格
    select product_id, new_price from A where last_date_order = 1
)
-- 合併Ｂ、Ｃ表，若price為null就訂為10
select B.product_id, ifnull(new_price,10) as "price" 
from B left join C on B.product_id = C.product_id