-- 問題: (寫一個可以回傳薪水第n高的function)
-- Write a SQL query to get the nth highest salary from the Employee table.

-- sol1: 
-- 使用limit 1 offset n
-- 不過有個問題是offset n回傳的會是第n+1筆數據
-- 所以要記得先把n設為n=n-1
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
set n = n-1;
  RETURN (
      # Write your MySQL query statement below.
      select distinct salary as "getNthHighestSalary" from employee order by salary desc limit 1 offset n
  );
END


-- sol2: 是dense_rank去算rank
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      with salary_table as(
        select salary, dense_rank() over(order by salary desc) as "salary_rank"
        from Employee
      ) 
      select max(salary) as "getNthHighestSalary"
      from salary_table
      where salary_rank = n
        
  );
  END