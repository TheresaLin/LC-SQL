-- 問題：找uerid = 1的使用者的朋友推薦的page_id，其中不包含userid = 1推薦的page_id
-- Write an SQL query to recommend pages to the user with user_id = 1 using the pages that your friends liked. 
-- It should not recommend pages you already liked.


-- For the virtual table A: union all所有id=1的朋友
with A as(
    select user1_id as "user_id" from friendship where user2_id = 1
    union all
    select user2_id as "user_id" from friendship where user1_id = 1
)
-- 從虛擬表Ａ去搜朋友喜歡的頁面，並排除id=1喜歡的頁面
select distinct page_id as "recommended_page" from likes 
where page_id not in (select page_id from likes where user_id = 1) and 
      user_id in (select user_id from A) 