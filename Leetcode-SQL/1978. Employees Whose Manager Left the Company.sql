
-- salary < 30000 and no employee_id


select employee_id
from employees
where manager_id not in (select distinct employee_id from employees) 
    and salary < 30000
order by 1