
-- outer join: use left join and right join
with com_table as (

    select e.employee_id, name, salary 
    from employees e left join salaries s using(employee_id)
    union 
    select s.employee_id, name, salary
    from employees e right join salaries s using(employee_id)
)

select distinct employee_id 
from com_table 
where name is null or salary is null
order by 1