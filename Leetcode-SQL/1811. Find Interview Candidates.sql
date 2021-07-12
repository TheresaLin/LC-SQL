-- 查出連續三次以上有得獎或得金牌三次以上
-- Write an SQL query to report the name and the mail of all interview candidates. 
-- A user is an interview candidate if at least one of these two conditions is true:
-- (1)The user won any medal in three or more consecutive contests.
-- (2)The user won the gold medal in three or more different contests (not necessarily consecutive).


-- 表Ａ先把所有有得獎的都union all
-- 表Ｂ中rnk連續得獎的會同號
-- 表Ｃ把得獎連續三次和金牌三次的人union all
with A as(
    select contest_id, gold_medal as "user" from contests
    union all
    select contest_id, silver_medal as "user" from contests
    union all
    select contest_id, bronze_medal as "user" from contests
), B as( 
    select user, contest_id, 
           contest_id - rank() over(partition by user order by contest_id) as "rnk" from A
), C as(
    select user from B group by 1, rnk having count(*)>=3
    union all
    select gold_medal from contests group by 1 having count(*)>=3
)
-- 最後查出他們的姓名和信箱
select distinct name, mail 
from users u right join C on u.user_id = C.user