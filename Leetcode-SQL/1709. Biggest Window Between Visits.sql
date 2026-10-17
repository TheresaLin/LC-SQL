-- Write a solution that will, for each user_id, find out the largest window of days between each visit 
-- and the one right after it (or today if you are considering the last visit).



with with_newest_date as(
    select * 
    from UserVisits
    union 
    select user_id, '2021-1-1' as "visit_date"
    from UserVisits
), with_rank as(
    select *, rank() over(partition by user_id order by visit_date) as date_rank
    from with_newest_date
)

select a.user_id, max(datediff(a.visit_date, b.visit_date)) as "biggest_window"
from with_rank a, with_rank b
where a.user_id = b.user_id and a.date_rank = b.date_rank + 1
group by 1