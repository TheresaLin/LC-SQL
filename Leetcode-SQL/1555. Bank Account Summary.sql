-- 計算每位客戶的credit
-- Write an SQL query to report. user_id, user_name, credit (current balance after performing transactions), credit_limit_breached (check credit_limit ("Yes" or "No"))

-- 表Ａ就是把要加或減的credit的製作成一個表
with A as(
    select paid_by as "id", -amount as "amount" from transactions
    union all
    select paid_to as "id", amount from transactions
    )
-- 最後加總
select user_id, user_name, credit + ifnull(sum(amount), 0) as "credit", 
       if(credit + ifnull(sum(amount), 0) < 0, "Yes", "No") as "credit_limit_breached" 
from users u left join A on u.user_id = A.id group by 1
