-- 問題: (查薪水第二高)Write a SQL query to get the second highest salary from the Employee table.

-- sol1: 用 limit 1 offset 1 就可列出第二名，offset返回你設定的下一行，放在select裡面這樣null不會報錯
select (select Distinct salary from Employee order by salary desc limit 1 offset 1) as "SecondHighestSalary"

-- sol2: 先用虛擬表排名，再選出排名第二的，用max(salary)null的時候就會跑出null
with salary_table as(
    select salary, dense_rank() over(order by salary desc) as "salary_rank" from Employee
 )
select max(salary) as "SecondHighestSalary"
from salary_table
where salary_rank = 2
