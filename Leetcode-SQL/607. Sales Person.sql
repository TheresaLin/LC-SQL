-- 題目：找出沒有賣過公司名為Red的銷售員 
-- 思路：有些人可能賣過Red，那要替除，所以用not in(賣過Red的人)。
-- 思路二：主要是找銷售員，所以以銷售員的table去延伸join其他table

select name
from SalesPerson
where name not in (
    select s.name
    from orders o
    right join salesPerson s on o.sales_id = s.sales_id
    left join company c on o.com_id = c.com_id
    where c.name = "Red"
)
