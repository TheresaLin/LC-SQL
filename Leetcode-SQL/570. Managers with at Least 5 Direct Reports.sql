-- 問題:(找manager至少有五個report的)
-- Given the Employee table, write a SQL query that finds out managers with at least 5 direct report.


-- 用having找
select e1.Name 
from employee e1 join employee e2 on e1.id = e2.managerid 
group by e1.id having count(e2.Id)>=5


-- 方法二比較快，在in裡面把有五個下屬的manager挑出來
select name
from Employee
where id in (
    select managerId
    from Employee
    group by 1
    having count(managerId) >= 5
)