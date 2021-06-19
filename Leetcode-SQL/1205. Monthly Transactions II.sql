-- 問題：以月份和國家分類計算approved和chargeback的數量和金額，若那筆交易是declined，時間就以chargebacks表的trans_date為基準
-- Write an SQL query to find for each month and country: 
-- the number of approved transactions and their total amount, the number of chargebacks, and their total amount.


-- 虛擬表Ａ：以時間和國家分類去計算appoved件數及金額
-- 若該交易被declined且有在chargeback裡，則時間為chargebacks表裡的時間，approved皆以transaction表裡的時間
with A as(
    select if(trans_id = t.id and state = "declined", date_format(c.trans_date, "%Y-%m"), date_format(t.trans_date, "%Y-%m")) as "month", 
           country, 
           sum(if(state = "approved", 1, 0)) as "approved_count", 
           sum(if(state = "approved", amount, 0)) as "approved_amount"
    from transactions t left join chargebacks c on c.trans_id = t.id group by 1,2
), B as(
-- 虛擬表Ｂ：以時間和國家分類去計算chargeback件數及金額
-- 全部時間都以chargeback表為基準
    select date_format(c.trans_date, "%Y-%m") as "month", 
           country, 
           count(c.trans_date) as "chargeback_count", 
           sum(if(trans_id = id, amount, 0)) as "chargeback_amount" 
    from chargebacks c join Transactions t on c.trans_id = t.id group by 1,2
)

-- 因為兩張表所有的資料都要顯示，需要AB兩張表full outer join(而mySQL無法用，所以可用union代替)
-- 上表left join下表right join，然後union兩table數值就不會有重複的
-- 最後去除全為０的數據用where approved_count and chargeback_count相加不為０的
select * from(
    select A.month, A.country, 
           ifnull(approved_count, 0) as "approved_count", 
           ifnull(approved_amount, 0) as "approved_amount", 
           ifnull(chargeback_count, 0) as "chargeback_count", 
           ifnull(chargeback_amount,0) as "chargeback_amount"  
    from A left join B on A.month = B.month and A.country = B.country
union
    select B.month, B.country, 
           ifnull(approved_count, 0) as "approved_count", 
           ifnull(approved_amount, 0) as "approved_amount", 
           ifnull(chargeback_count, 0) as "chargeback_count", 
           ifnull(chargeback_amount,0) as "chargeback_amount" 
    from A right join B on A.month = B.month and A.country = B.country) C 
where approved_count + chargeback_count != 0