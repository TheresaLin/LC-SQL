-- 問題: Write an SQL query to find the number of times each student attended each exam.
-- 是一題要關聯很多張表的題目，要清楚怎麼關聯，對cross/left/inner join要熟悉

-- 正確寫法，要所有科目和學生所以student cross join subject left join exam
-- 這邊if也可以用case when取代(case when在這邊時間複雜度低，較優)，group by可以後面接要排列的行
select st.student_id, st.student_name, sub.subject_name, if(e.subject_name is Null,0,count(e.subject_name)) "attended_exams" 
from students st cross join subjects sub left join examinations e on e.student_id = st.student_id and e.subject_name = sub.subject_name 
group by 1,2,3 order by 1,2,3

-- 錯誤寫法:考慮join順序問題
select e.student_id, st.student_name, sub.subject_name, if(e.subject_name is Null,0,count(e.subject_name)) "attended_exams" 
from subjects sub left join examinations e join students st on e.student_id = st.student_id and e.subject_name = sub.subject_name 
group by 1,2,3 order by 1,2,3