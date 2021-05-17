-- 問題：計算90天內首次登入的用戶個數
-- Write an SQL query that reports for every date within at most 90 days from today, 
-- the number of users that logged in for the first time on that date. Assume today is 2019-06-30.



-- 首先虛擬表先把每個用戶第一次login的時間記錄下來
with A as(
    select user_id, min(activity_date) as "first_login" from traffic 
    where activity = 'login' group by 1
)
-- 最後計算虛擬表90天內登入的用戶個數
select first_login as "login_date", count(user_id) as "user_count" from A 
where datediff('2019-06-30', first_login) <= 90 group by 1 