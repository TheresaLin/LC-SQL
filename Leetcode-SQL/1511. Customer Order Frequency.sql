-- 問題: (列出6.7月都花超過100元的人)
-- Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.


-- 這題我用with select出六月七月以顧客分類總合當月消費金額的虛擬表
-- 最後select找6.7月都>=100的顧客
with June AS(
    select c.customer_id, c.name, sum(price*quantity) "June_sum" 
    from orders o join customers c left join product p  
        on c.customer_id = o.customer_id and o.product_id = p.product_id 
    where order_date between '2020-06-01' and '2020-06-30' group by 1 ),
July AS(
    select o.customer_id, c.name, sum(price*quantity) "July_sum" 
    from orders o join  customers c left join product p 
        on o.customer_id = c.customer_id and o.product_id = p.product_id 
    where order_date between '2020-07-01' and '2020-07-31' group by customer_id)

select June.customer_id, June.name 
from June left join July on June.customer_id = July.customer_id 
where June_sum>=100 and July_sum>=100



-- 這個方法是在having條件裡面加月份為6和7時sum(price*quantity)要>=100
-- month(date)=06是指月份為六月
select c.customer_id, c.name
from orders o join customers c on c.customer_id = o.customer_id 
    join product p on o.product_id = p.product_id
group by 1
having sum(case when month(order_date)=06 then price*quantity end)>=100 
    and sum(case when month(order_date)=07 then price*quantity end)>=100 