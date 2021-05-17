-- 問題：列出日期(每個player_id開始安裝遊戲的那天)、當天多少人安裝以及當天安裝的人隔天繼續玩的機率(隔天馬上玩的玩家個數/今日安裝的玩家個數)
-- Write an SQL query that reports for each install date, the number of players that installed the game on that day and the day 1 retention.


-- 首先用個虛擬表Ａ,用lead()找玩家下次玩遊戲是哪天,並用min()找玩家安裝遊戲的那天
-- 記得partition by player_id 完一定要 order by event_date,否則欄位會對不準
with A as(
    select event_date, player_id, 
        lead(event_date) over(partition by player_id order by event_date) as "sec_date", 
        min(event_date) over(partition by player_id order by event_date) as "first_date" 
    from activity
)
-- install_dt就是剛剛搜出來的first_date,有多少人在那天安裝為installs
-- Day1_retention：第二次玩減掉第一次玩如果為1，代表玩家隔天也有玩，全部加總起來除以當天所有安裝的人
-- 這個需要group by first_date且前提是first_date = event_date，因為Ａ表算出來會是每個玩家所有玩的日期，所以只group by first_date會計算倒不止安裝當天的玩家
select first_date as "install_dt", count(player_id) as "installs", 
       round(sum(if(sec_date-first_date=1,1,0))/count(player_id),2) as "Day1_retention" 
from A where first_date = event_date group by first_date 
