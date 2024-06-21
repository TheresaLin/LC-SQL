-- Write a solution to find all customers who never order anything.
-- 找出沒有買東西的客戶

select name as Customers
from Customers
where id not in (select customerId from Orders)