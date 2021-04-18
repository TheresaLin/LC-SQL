-- 找票數最多的候選人
-- Write a sql to find the name of the winning candidate

-- 先在subquery排列出票數，由多至少，然後用limit 1，指定最多的那個
select name from(select name, count(candidateid) as "vote_num" 
                 from candidate c join vote v on c.id = v.candidateid group by c.id order by 2 desc)A 
limit 1