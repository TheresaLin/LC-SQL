-- 問題：計算每個顧客第一次訂單當天就收到貨的機率
-- Write an SQL query to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.



-- Method 1
-- 虛擬表Ａ：先依下訂單的日期排列出每個顧客的訂單順序及抵達時間
with A as(
    select customer_id, 
           row_number() over(partition by customer_id order by order_date) as "date_rank", 
           order_date, customer_pref_delivery_date 
    from delivery
)
-- 根據Ａ表每個顧客的第一筆訂單，開始確認下訂時間和送達時間是否一致，若一致則為1，加總除以總顧客數，由此計算機率
select round(sum(if(order_date = customer_pref_delivery_date, 1, 0))/count(*)*100, 2) as "immediate_percentage" 
from A where date_rank = 1 


-- Method 2：（較有效率）先分類抵達狀態再計算
-- 虛擬表Ａ：先依下訂單的日期排列出每個顧客的訂單順序及抵達狀態(immediate/schedule)
with A as(
    select customer_id, row_number() over(partition by customer_id order by order_date) as "date_rank", 
           if(order_date = customer_pref_delivery_date, "immediate", "scheduled") as "delivery" from delivery
)
-- 根據表Ａ每個顧客的第一筆訂單，開始確認是否狀態為immediate，是為1，加總除以總顧客數，由此計算機率
select round(sum(if(delivery = "immediate", 1, 0))/count(*)*100, 2) as "immediate_percentage" 
from A where date_rank = 1 
