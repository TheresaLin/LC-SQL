-- 問題：找同一天閱讀超過兩篇文章的viewer
-- Write an SQL query to find all the people who viewed more than one article on the same date, sorted in ascending order by their id.

-- 簡單！反正就是group by viewer_id and view_date，然後在having那邊限制只列出文章數超過１的
select distinct viewer_id as "id" from views group by 1, view_date  
having count(distinct article_id)>1 order by 1