-- Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
-- 找出重複出現的email

with cte as(
    select email, count(id) as id_count
    from person
    group by email
)

select email
from cte
where id_count >= 2