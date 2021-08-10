-- 找超過兩個人的team
-- Write an SQL query to get the team_id of each employee that is in a team.


-- 在where搜用salary分組過後超過兩個employee的組
select employee_id, name, salary, 
       dense_rank() over(order by salary) as "team_id" 
from employees where salary in (select salary from employees group by 1 having count(*)>1)