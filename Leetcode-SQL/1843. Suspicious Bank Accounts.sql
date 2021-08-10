-- 找出連續兩個月以上creditor總金額都大於max_income的帳號
-- Write an SQL query to report the IDs of all suspicious bank accounts.


-- Ａ表date以年月分標示並只列出creditor總金額大於max_income
with A as(
    select T.account_id, 
           date_format(day, "%Y%m") as "date", 
           sum(amount) as "total_amount", 
           max_income
    from transactions T join accounts A on T.account_id = A.account_id 
    where type = "Creditor"
    group by 1, 2 
    having total_amount > max_income 
    order by 2, 1 
    )
-- Ａ表搜出creditor總金額大於max_income，接下來我們要來找有連續兩個月出現的帳戶
-- 聯集同個表，並使用period_diff(period1, period2)＝１以列出連續兩個月都出現的帳號  
select distinct A1.account_id 
from A A1 join A A2 on A1.account_id = A2.account_id 
                    and period_diff(A1.date, A2.date)=1