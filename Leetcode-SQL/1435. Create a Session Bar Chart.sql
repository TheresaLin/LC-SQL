-- 問題: 統計不同時間段(列標頭)的使用者人數
-- Write an SQL query to report the (bin, total) in any order.
-- 這題使用with新增虛擬表，行列都有標頭的情況下使用

-- 先創cte虛擬表以bin來，自訂列標頭以時間間隔區分，並用union all聯集所有column，都取為bin
-- 再創a虛擬表統計每個時間段的人數在total欄，並group by時間段bin
-- 最後select是聯合查詢cte和a

with cte as (
    select '[0-5>' as "bin" union all
    select '[5-10>' as "bin" union all
    select '[10-15>' as "bin" union all
    select '15 or more' as "bin"), 
a as(select 
        count(case when duration/60 between 0 and 5 then session_id
                   when duration/60 between 5 and 10 then session_id
                   when duration/60 between 10 and 15 then session_id
                   when duration/60 > 15 then session_id end) "total",
        (case when duration/60 between 0 and 5 then '[0-5>'
              when duration/60 between 5 and 10 then '[5-10>'
              when duration/60 between 10 and 15 then '[10-15>'
              when duration/60 > 15 then '15 or more' end) "bin"
    from sessions group by bin)
    
select cte.bin, ifnull(a.total,0) "total" from cte left join a on cte.bin = a.bin 