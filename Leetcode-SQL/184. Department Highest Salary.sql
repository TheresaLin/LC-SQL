-- 問題: (找出每個department中最高salary的人，可能不只一人)
-- Write a SQL query to find employees who have the highest salary in each of the departments.


-- 因為答案不只一人，所以用dense_rank()，因為可以排出多個第一名
-- 記得用partition by depaetment，order by salary用降序desc
-- 最後搜排名是第一名的所有人
select department, employee, salary 
from(select d.name as "Department", e.name as "Employee", salary, 
            dense_rank() over(partition by d.name order by salary desc) "salary_rank" 
     from employee e join department d on e.departmentid = d.id) a 
where a.salary_rank = 1
