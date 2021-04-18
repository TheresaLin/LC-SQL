-- 問題：找每個followee擁有的follower，且followee必須是follower那欄有出現過的人，否則不列入計算
-- write a sql query to get the amount of each follower’s follower if he/she has one.

-- join同張表得出誰有在follower list上
-- count要用distinct不然會有重複的被計算到
select f1.followee as "follower", count(distinct f1.follower) as "num" 
from follow f1 join follow f2 on f1.followee = f2.follower group by 1