-- 1. switch two col and combine with the original one
with all_friends as(
    select user2 as "user1",
        user1 as "user2"
    from friends
    union
    select *
    from friends
)
-- main query: calculate the percentage: the denominator should be num of all_user, 
-- but if we do group by, we cannot calculate all_user
select user1, 
    round(count(distinct user2)/(select count(distinct user1) from all_friends)*100, 2) as "percentage_popularity"
from all_friends
group by 1
order by 1