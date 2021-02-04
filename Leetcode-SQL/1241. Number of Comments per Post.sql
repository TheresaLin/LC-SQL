-- 問題: Write an SQL query to find number of comments per each post.
-- 這題要注意有重複的數據問題，所以在第一個from table要先處理重複問題
-- 第二欄count(distinct s2.sub_id)是結合join同個表關聯的欄位搜尋的欄位，所以要非常清楚關聯後的欄位的關係
select distinct s1.sub_id "post_id", count(distinct s2.sub_id) "number_of_comments" 
from (select sub_id, parent_id from submissions group by sub_id)s1 
    left join submissions s2 on s1.sub_id = s2.parent_id where s1.parent_id is Null group by s1.sub_id