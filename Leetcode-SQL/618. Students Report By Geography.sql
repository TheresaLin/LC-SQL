-- 像是用pivot table去改變

-- use virtual table to give every row id by continent
-- America: 1. name A, 2. name B; Asia: 1. name C...
with student_group as(
select *, 
    row_number() over(partition by continent order by name) as "row_id"
from student    
)

-- group by id
--   | America | Asia | Europe |
-- 1 | name A  |name B| name C |
-- 2 | name B  | null | null   |
select max(case when continent = "America" then name end) as "America",
       max(case when continent = "Asia" then name end) as "Asia",
       max(case when continent = "Europe" then name end) as "Europe"
from student_group
group by row_id