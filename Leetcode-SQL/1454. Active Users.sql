-- 找連續五天以上都有登入的用戶 Write an SQL query to find the id and the name of active users.


-- 和1225題解法很像，奸詐的是他logins表居然有重複值，先讓表沒重複值後再查詢
-- 利用有沒有partition by的差異去分組
with A as(
    select id, login_date, 
           dense_rank() over(order by login_date) - dense_rank() over(partition by id order by login_date) as "team" 
    from (select distinct id, login_date from logins) B
    )
-- 藉由id和team去計算有沒有連續五天以上的人
select distinct A.id, name 
from Accounts join A on Accounts.id = A.id 
group by A.id, team having count(*)>=5 order by 1