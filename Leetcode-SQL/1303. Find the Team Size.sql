-- 問題: (每個人的組長度) Write an SQL query to find the team size of each of the employees.
-- 這題蠻酷的，要用over(partition by) 來分組，因為用group by只會顯示同組的某一人和組數，不會每個人都顯示

--方法一
select employee_id, count(*)over(partition by team_id)"team_size" from employee

-- 方法二用子查詢，速度比較慢
select employee_id, (select count(employee_id) from Employee where team_id=e.team_id) "team_size" from Employee e