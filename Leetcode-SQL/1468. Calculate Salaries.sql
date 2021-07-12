-- 根據每個公司最高薪水的range制定tax
-- Write an SQL query to find the salaries of the employees after applying taxes.


-- 解法一：Ａ表找出每個公司最高薪水並對應相對的稅
with A as(
    select company_id, if(max(salary)<1000, 
                          1-0, 
                          if(max(salary)>=10000, 
                             1-0.49, 
                             1-0.24)) as "tax" 
    from salaries group by 1
    )
-- 然後對應company_id得出最後薪水
select s.company_id, employee_id, employee_name, round(salary*tax, 0) as "salary" 
from A join salaries s on A.company_id = s.company_id



-- 解法二：用max() over(partition by)去查最高薪水並用對應的稅
select company_id, employee_id, employee_name, 
       round(salary * if(max(salary) over(partition by company_id)<1000, 
                         1-0, 
                         if(max(salary) over(partition by company_id)>=10000, 
                            1-0.49, 
                            1-0.24)), 0) as "salary" 
from salaries 
