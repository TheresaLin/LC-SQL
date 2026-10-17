-- Write a solution to report for each player and date, how many games played so far by the player. 
-- 找玩家目前為止玩了多少場遊戲，所以每筆資料都要加先前玩的遊戲

-- 用sum的window function，才可以根據加總目前玩的遊戲次數
select player_id, event_date, sum(games_played) over(partition by player_id order by event_date) as "games_played_so_far"
from activity