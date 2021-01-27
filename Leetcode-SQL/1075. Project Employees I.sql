-- 問題: 算平均經歷(小數點後兩位) 
-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
select project_id, round(sum(e.experience_years)/count(p.employee_id),2) "average_years" 
from project p join employee e on p.employee_id=e.employee_id group by p.project_id