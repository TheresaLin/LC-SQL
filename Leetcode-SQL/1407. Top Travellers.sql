-- 問題: Write an SQL query to report the distance travelled by each user.


select name, ifnull(sum(distance),0) "travelled_distance" 
from users u left join rides r on r.user_id = u.id 
group by user_id order by 2 desc,1