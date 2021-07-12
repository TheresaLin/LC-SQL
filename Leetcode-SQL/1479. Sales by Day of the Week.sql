-- 分類的產品放第一行，星期一到日放第一列， 算出每個類別星期幾的銷售額
-- Write an SQL query to report how many units in each category have been ordered on each day of the week.


-- date_format("%w")以數字代表星期幾，而1代表週一，依此類推，但是記住週日以0代表
select distinct item_category as "Category", 
       sum(if(date_format(order_date, "%w")='1', quantity, 0)) as "Monday",
       sum(if(date_format(order_date, "%w")='2', quantity, 0)) as "Tuesday",
       sum(if(date_format(order_date, "%w")='3', quantity, 0)) as "Wednesday",
       sum(if(date_format(order_date, "%w")='4', quantity, 0)) as "Thursday",
       sum(if(date_format(order_date, "%w")='5', quantity, 0)) as "Friday",
       sum(if(date_format(order_date, "%w")='6', quantity, 0)) as "Saturday",
       sum(if(date_format(order_date, "%w")='0', quantity, 0)) as "Sunday"
from orders o right join items i on o.item_id = i.item_id group by 1 order by 1
