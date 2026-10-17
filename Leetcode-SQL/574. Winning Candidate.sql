-- 找票數最多的候選人
-- Write a sql to find the name of the winning candidate

-- 先在subquery排列出票數，由多至少，然後用limit 1，指定最多的那個
select name from(select name, count(candidateid) as "vote_num" 
                 from candidate c join vote v on c.id = v.candidateid group by c.id order by 2 desc)A 
limit 1



-- SOL 2: 先用虛擬表找出第一名，之後再把名字show出來
with vote_num as(
    select candidateId, count(id) as "total_vote"
    from vote
    group by 1
    order by 2 desc
    limit 1
)

select name
from candidate
where id = (select candidateId from vote_num)