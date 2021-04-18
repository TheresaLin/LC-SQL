-- 問題: (找出最多好友的人，收到好友邀請+發送好友請求 加總總數最多的)
-- Write a query to find the the people who has most friends and the most friends number under the following rules:
-- It is guaranteed there is only 1 people having the most friends.
-- The friend request could only been accepted once, which mean there is no multiple records with the same requester_id and accepter_id value.


-- 先搜所有 送request的id 和 accept的id，並且把他們聯集(要用union all重複的值才會都列入)
-- 然後計算總數最多的人並只列出一個
select id, count(*) as "num" from 
    (select requester_id as "id" from request_accepted 
            union all 
    select accepter_id as "id" from request_accepted) A 
group by 1 order by 2 desc limit 1