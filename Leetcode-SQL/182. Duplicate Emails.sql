-- Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
-- 找出重複出現的email
-- sol1
with cte as(
    select email, count(id) as id_count
    from person
    group by email
)

select email
from cte
where id_count >= 2


-- sol2: without with window
-- use having
select distinct email
from Person
group by email
having count(id) > 1