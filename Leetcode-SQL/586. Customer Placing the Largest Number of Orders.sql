-- 題目：找擁有最多訂單的客戶

-- sol 1:
with order_count as(
    select customer_number, count(order_number) order_cnt
    from Orders
    group by customer_number
)
select customer_number
from order_count
order by order_cnt desc
limit 1

-- sol 2:
select customer_number
from Orders
group by customer_number
order by count(order_number) desc
limit 1