-- 問題: (找出每個department裡面薪水前三高的人)
-- Write a SQL query to find employees who earn the top three salaries in each of the department.

-- 需要子查詢先列出每個department的薪水排名，使用dense_rank
-- 最後主查詢where rank in (1,2,3)名的都列出
select department, employee, salary 
from(select d.name as "department", 
            dense_rank() over(partition by departmentId order by salary desc) as "salary_rank", 
            e.name as "employee", salary from employee e join department d on e.departmentId = d.id) A 
where salary_rank in (1,2,3)
