-- Write an SQL query to compute moving average of how much customer paid in a 7 days window (current day + 6 days before) .


-- 這題有新用法over(order by 時間欄位 range interval '向前數多少天數' day preceding and interval '向後數多少天數' day following)
-- 首先以時間排序，並利用range interval '6' day preceding把當前數據的前六筆做運算，並把每筆編號
-- 由於我們只要第七天以後的加總和平均，需要對每筆資料編號，然後最後找第七筆以後的資料
with A as(
    select visited_on, 
           sum(amount) over(order by visited_on range interval '6' day preceding) as "amount", 
           round(avg(amount) over(order by visited_on range interval '6' day preceding), 2) as "average_amount", 
           row_number() over(order by visited_on) as "rownum" 
    from (select visited_on, sum(amount) as "amount" from customer group by 1) a order by 4
    )
select visited_on, amount, average_amount from A where rownum > 6