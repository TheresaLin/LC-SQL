-- 問題: 找出不相同名，不相同ID的學生分組組合
-- Write an SQL query to find all the possible triplets representing the country under the given constraints.

-- 資料表沒有互相關聯，所以不用用join，直接用where排除重名和重id的組合
select a.student_name as "member_A",  b.student_name as "member_B", c.student_name as "member_C" 
from SchoolA A, SchoolB B, SchoolC C 
where a.student_name != b.student_name and a.student_name != c.student_name and b.student_name != c.student_name 
    and a.student_id != b.student_id and a.student_id != c.student_id and b.student_id != c.student_id