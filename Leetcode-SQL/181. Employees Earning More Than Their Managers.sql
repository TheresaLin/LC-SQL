-- Write a solution to find the employees who earn more than their managers.
-- 找出薪水比自己manager還高的


-- sol1: 拼接同一個表e1代表下屬，e2代表主管，找出e1.salary > e2.salary
select e1.name as Employee
from Employee e1 join Employee e2 on e1.managerId = e2.id 
where e1.salary > e2.salary

-- sol2: same concept with sol1, but not using "join"
select e.name as Employee
from Employee e, Employee m
where e.managerId = m.id and e.salary > m.salary
