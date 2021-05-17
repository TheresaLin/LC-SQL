-- 問題：找出每個學生最高的成績，如果有兩堂課成績一樣高，挑course_id較小的那堂課
-- Write a SQL query to find the highest grade with its corresponding course for each student. 
-- In case of a tie, you should find the course with the smallest course_id. The output must be sorted by increasing student_id.


-- 方法一：在where裡面先搜成績最高的student_id,grade，接著再排除成績相同的課，所以以最小的course_id為第一選擇
select student_id, min(course_id) as "course_id", grade from enrollments 
where (student_id, grade) in (select student_id, max(grade) as grade from enrollments group by 1) 
group by 1 order by 1


-- 方法二：虛擬表Ａ為每個學生每堂課的成績排名，所以結果會是學生1的最好成績排到最爛成績，再來學生2並以此類推，不同課卻相同成績就會以course_id小的順序排前
with A as(
    select student_id, grade, 
           dense_rank() over(partition by student_id order by grade desc, course_id) as "grade_rank", 
           course_id 
    from enrollments
)
-- 選出每個學生成績排第ㄧ的課
select student_id, course_id, grade from A where grade_rank = 1