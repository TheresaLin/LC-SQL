
-- find out the common friends >= 3 in user1 and user2

with friend as(
    select * 
    from friendship
    union
    select user2_id as "user1_id",
        user1_id as "user2_id"
    from friendship    
)

select 
    fs.user1_id, fs.user2_id,
    count(f2.user2_id) as "common_friend"
from friendship fs join friend f1 on fs.user1_id = f1.user1_id -- user1's friends
    join friend f2 on fs.user2_id = f2.user1_id -- user2's friends
                    and f1.user2_id =f2.user2_id -- common friends
group by 1, 2
having common_friend >= 3

