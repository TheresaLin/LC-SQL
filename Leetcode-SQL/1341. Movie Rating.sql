-- Write the following SQL query:

-- (1)Find the name of the user who has rated the greatest number of movies.
--    In case of a tie, return lexicographically smaller user name.

-- (2)Find the movie name with the highest average rating in February 2020.
--    In case of a tie, return lexicographically smaller movie name.



-- Ａ表算出每個人自己評選的電影數
-- Ｂ表算出每個電影二月平均的評分
with A as(
    select name as "name", count(*) as "ratenum"
    from movie_rating mr join users u on mr.user_id = u.user_id 
    group by 1
    ), B as(
    select title,  avg(rating) as "avg_rating" 
    from movie_rating mr join movies m on mr.movie_id = m.movie_id
    where created_at between '2020-02-01' and '2020-02-29' group by 1
    )

-- 最後把(1),(2)需求用union all 合併，因為(1)(2)都只需要個搜出一個，所以求出後用order by再limit 1
(select name as "results" from A where ratenum = (select max(ratenum) from A) order by 1 limit 1)
union all
(select title as "results" from B where avg_rating = (select max(avg_rating) from B) order by 1 limit 1)