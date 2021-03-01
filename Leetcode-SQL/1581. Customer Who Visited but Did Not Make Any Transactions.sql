-- 問題: 查詢沒有完成交易的客戶，並算出有多少筆交易未完成
-- Write an SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

-- 我先搜尋已完成過交易的人
-- 然後用not in排除掉已經繳過成功完成交易的人
select customer_id, count(v.visit_id) as "count_no_trans" 
from visits v left join transactions t on v.visit_id = t.visit_id 
where v.visit_id not in (select distinct v.visit_id 
    from transactions t left join visits v on v.visit_id = t.visit_id) group by 1

-- 另個方法是用with虛擬表，先把visits left join到transactions而交易未成功的會顯示null
-- 所以虛擬表是找null的，然後再對虛擬表搜尋
with A as(
select customer_id, v.visit_id, amount 
from visits v left join transactions t on v.visit_id = t.visit_id
where amount is Null
)

select customer_id, count(*) as "count_no_trans" from A group by 1