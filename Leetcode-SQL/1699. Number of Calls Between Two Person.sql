-- 列出兩個
-- Write an SQL query to report the number of calls and the total call duration between each pair of distinct persons (person1, person2) where person1 < person2.



select least(from_id, to_id) as "person1", greatest(from_id, to_id) as "person2", 
       count(*) as "call_count", sum(duration) as "total_duration" 
from calls group by 1, 2