-- 問題: (找梅在departments表裡面的學生)
-- Write an SQL query to find the id and the name of all students who are enrolled in departments that no longer exists.

-- 果斷用not in，不過效率比較差46%
select id, name 
from students 
where department_id not in(select id from departments)

-- 用left join效率高91.18%
select s.id,s.name 
from students s left join departments d on s.department_id = d.id
where d.id IS NULL