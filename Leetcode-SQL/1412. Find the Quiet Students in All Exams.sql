-- 列出不是第一名也不是最後一名的學生
-- Write an SQL query to report the students (student_id, student_name) being "quiet" in ALL exams.

-- 思路很簡單：
-- Ａ表的rnk1是依照該科目第一名排序下來，rnk2是依照該科目最後一名排序下來
with A as(
select exam_id, student_id, score, 
       rank() over(partition by exam_id order by score desc) as "rnk1", 
       rank() over(partition by exam_id order by score) as "rnk2" from exam
    )
-- 最後排除rnk1=1或者rnk2=1的同學
select distinct e.student_id, student_name 
from student s join exam e on s.student_id = e.student_id 
where e.student_id not in (select distinct student_id from A where rnk1 = 1 or rnk2 = 1) order by 1
