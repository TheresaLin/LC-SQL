-- 問題：找出玩家的第一次登入時間
-- 方法：先用虛擬表，列出每個玩家場次的順序(用row_number)

with login_activity as(
    select player_id,
        row_number() over(partition by player_id order by event_date) as login_num,
        event_date
    from Activity
)

select player_id, event_date as first_login
from login_activity
where login_num = 1