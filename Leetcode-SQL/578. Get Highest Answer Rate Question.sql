-- 問題: (找最高answer rate)
-- Write a sql query to identify the question which has the highest answer rate.

-- 用case when算answer rate並排序，再用limit 1取最大的那個
select question_id as "survey_log" 
from(select question_id, sum(case when action = "answer" then 1 else 0 end)/
                         sum(case when action ="show" then 1 else 0 end) as "answer_rate" 
     from survey_log group by 1 order by 2 desc) A limit 1


-- 用虛擬表，表現沒那麼佳，不過還是另一種方法，概念跟上一題差不多
with A as(
select question_id, sum(case when action = "answer" then 1 else 0 end)/
                    sum(case when action ="show" then 1 else 0 end) as "answer_rate" 
from survey_log group by 1 order by 2 desc
)
select question_id as "survey_log" from A limit 1

