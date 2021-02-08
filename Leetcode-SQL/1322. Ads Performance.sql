-- 問題: Write an SQL query to find the ctr of each Ad.
-- 這題action有三類: Viewed, Ignored, Clicked,分母只要算Viewed和Clicked的
-- 用case when做的
select ad_id, ifnull(round(100*sum(case when action = 'Clicked' then 1 else 0 end)/
                               sum(case when action = 'Clicked' then 1 when action = 'Viewed' then 1 else 0 end),2),0) "ctr" 
from ads group by 1 order by 2 desc, 1

-- 用if()做的
select ad_id, ifnull(round(100*sum(if(action='Clicked',1,0))/
                               sum(if(action ='Clicked' or action = 'Viewed',1,0)),2),0) "ctr" 
from ads group by 1 order by 2 desc, 1