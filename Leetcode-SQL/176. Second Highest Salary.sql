-- 問題: (查薪水第二高)Write a SQL query to get the second highest salary from the Employee table.

-- 用 limit 1 offset 1 就可列出第二名，offset返回你設定的下一行，放在select裡面這樣null不會報錯
select (select Distinct salary from Employee order by salary desc limit 1 offset 1) as "SecondHighestSalary"
