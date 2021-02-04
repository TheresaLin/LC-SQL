-- 問題: Write an SQL query to find each query_name, the quality and poor_query_percentage.
-- We define query quality as: The average of the ratio between query rating and its position.
-- We also define poor query percentage as: The percentage of all queries with rating less than 3.


-- 自己用case()，runtime beats只有24.5%
select query_name, round(sum(rating/position)/count(result),2) "quality", 
        round((count(case when rating<3 then rating end)/count(result))*100,2) "poor_query_percentage" 
from queries group by query_name



-- 看網友用if():runtime beats有86.67%
select query_name, round(sum(rating/position)/count(result),2) "quality", 
        round(sum(if(rating<3,1,0))/count(result)*100,2) "poor_query_percentage" 
from queries group by query_name

