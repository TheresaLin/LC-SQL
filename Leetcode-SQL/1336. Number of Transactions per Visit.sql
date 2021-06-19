-- Write an SQL query to find how many users visited the bank and didn't do any transactions, how many visited the bank and did one transaction and so on.


-- recursive作用在Ｂ表，因為他最後需要多少欄位是Ａ表visitnum的最大值
with recursive A as(
    select v.user_id, v.visit_date,
           sum(if(v.visit_date =  t.transaction_date, 1, 0)) as "visitnum" 
    from visits v left join transactions t on v.user_id = t.user_id group by 1,2 order by 1
), B as(
    select 0 as "transactions_count"
    union all
    select transactions_count+1
    from B
    where transactions_count< (select max(visitnum) from A)
)

select transactions_count, ifnull(count(user_id),0) as "visits_count" 
from A right join B on A.visitnum = B.transactions_count group by 1