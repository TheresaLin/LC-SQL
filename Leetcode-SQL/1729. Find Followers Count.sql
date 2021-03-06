-- 問題: (計算每個user的follower有幾個)
-- Write an SQL query that will, for each user, return the number of followers. Return the result table ordered by user_id.

select user_id, count(distinct follower_id) as "followers_count" from followers group by 1