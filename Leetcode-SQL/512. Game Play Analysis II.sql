-- Write a solution to report the device that is first logged in for each player.
-- 找到玩家首次登入的裝置


-- 要注意，min或max值只會跟隨group by的col，所以如果中間穿查沒有group by到的col，會給出不對的答案
-- 從where裡面subquery 每個玩家的首次登入時間，就可以從中找到對應的裝置
select player_id, device_id
from activity
where (player_id, event_date) in (
        select player_id, min(event_date)
        from activity
        group by 1
)

-- 直接給每筆數據根據玩家登入時間做排序，拿排序為一的就是首次登入
with date_rank_table as(
    select player_id, device_id, rank() over(partition by player_id order by event_date) as "date_rank"
    from activity
)
select player_id, device_id
from date_rank_table
where date_rank = 1
        
