-- 問題：每個spend_date有多少使用手機、桌機或者兩者都用的用戶
-- Write an SQL query to find the total number of users and the total amount spent using mobile only, desktop only and both mobile and desktop together for each date.


-- Ａ虛擬表：left join同一張表spend_date, user_id都一樣但是platform不同，這樣同時使用手機和桌機的用戶就會被b表搜出來，而b表空值的就是只有用手機或桌機
-- 同時group by:spend_date 和新分類的platform，計算出total_users和total_amount
with A as(
    select a.spend_date, count(distinct a.user_id) as "total_users", 
           if(b.platform is not Null, "both", a.platform) as platform, 
           sum(a.amount) as "total_amount" 
    from spending a left join spending b 
         on a.spend_date = b.spend_date 
         and a.user_id = b.user_id 
         and a.platform != b.platform 
    group by 1,3
),
-- B虛擬表：聯集使每天platform欄位底下的數據有mobile, desktop, and both
B as(
    select distinct spend_date,
            'mobile' as platform from Spending
    union all
     select distinct spend_date,
            'desktop' as platform from Spending
    union all
     select distinct spend_date,
            'both' as platform from Spending
)
-- right join Ａ、Ｂ兩張表，使每天都有mobile, desktop, and both，而空值就為０
select B.spend_date, B.platform,  ifnull(total_amount, 0) as "total_amount" , ifnull(total_users, 0) as "total_users" from A right join B on A.platform = B.platform and A.spend_date = B.spend_date order by 2 