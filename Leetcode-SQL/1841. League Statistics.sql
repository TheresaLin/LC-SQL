-- home_team_id和away_team_id 對應到 home_team_goals和away_team_goals列出每隊總共上場多少局、贏得多少分(贏3, 平手1, 輸0)、獲得的goal、對方多少goal、輸對方多少goal
-- Write an SQL query to report the statistics of the league. The statistics should be built using the played matches where the winning team gets three points and the losing team gets no points. 
-- If a match ends with a draw, both teams get one point.


-- 我的解法，沒有將home_team和away_team union起來，以搜尋條件都要先以當前的team_id是屬於home_team還是away_team
select distinct team_name,  
       sum(if(home_team_id = team_id, 1, 0)) + sum(if(away_team_id = team_id, 1, 0)) as "matches_played", 
       sum(if(home_team_id = team_id and home_team_goals > away_team_goals, 3, if(home_team_id = team_id and home_team_goals = away_team_goals, 1, 0))) 
       +  sum(if(away_team_id = team_id and home_team_goals < away_team_goals, 3, if(away_team_id = team_id and home_team_goals = away_team_goals, 1, 0))) as "points",
       sum(if(home_team_id = team_id, home_team_goals, 0)) + sum(if(away_team_id = team_id, away_team_goals, 0)) as "goal_for",
       sum(if(home_team_id = team_id, away_team_goals, 0)) + sum(if(away_team_id = team_id, home_team_goals, 0)) as "goal_against",
       sum(if(home_team_id = team_id, home_team_goals, 0)) + sum(if(away_team_id = team_id, away_team_goals, 0)) 
       - (sum(if(home_team_id = team_id, away_team_goals, 0)) 
       + sum(if(away_team_id = team_id, home_team_goals, 0))) as "goal_diff"
       from teams, matches group by 1 order by 3 desc, 6 desc, 1


-- 別人的做法，先把away_team也當成home_team且對手換成away_team然後union在一起，goal_for、goal_against直接sum(home)和sum(away)就好
select
    team_name
    , count(*) as matches_played
    , sum(case when home > away then 3 when home = away then 1 else 0 end) as points
    , sum(home) as goal_for
    , sum(away) as goal_against
    , sum(home) - sum(away) as goal_diff
    
from 
    (select home_team_id, home_team_goals as home, away_team_goals as away from matches
     union all
     select away_team_id as home_team_id, away_team_goals as home, home_team_goals as away from matches
	 ) g
join teams t on g.home_team_id = t.team_id
group by 1
order by 3 desc, 6 desc, 1