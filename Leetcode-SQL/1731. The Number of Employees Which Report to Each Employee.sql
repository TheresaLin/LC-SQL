-- 問題: (連接同一張表)
-- Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, 
-- and the average age of the reports rounded to the nearest integer. Return the result table ordered by employee_id.

-- 要搞清楚每個欄位應該要從哪個表裡面呼叫
select e1.employee_id, e1.name, count(*) as "reports_count", round(avg(e2.age),0) as "average_age" 
from employees e1 join employees e2 on e1.employee_id = e2.reports_to 
group by 1 order by 1