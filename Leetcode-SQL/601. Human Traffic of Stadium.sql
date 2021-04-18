-- 問題: ID是連號超過三號且people都大於100的
-- Write an SQL query to display the records with three or more rows with consecutive id's, 
-- and the number of people is greater than or equal to 100 for each.
-- Return the result table ordered by visit_date in ascending order.


-- 三張同樣的表關聯，連續三號有六種情況，分別是321、312、213、231、123、132
-- 所以where裡面是這六種情況
select distinct s1.id, s1.visit_date, s1.people 
from stadium s1 join stadium s2 join stadium s3 
where ((s3.id-s1.id = 2 and s3.id-s2.id = 1) or (s3.id-s2.id = 2 and s3.id-s1.id = 1) or 
       (s2.id-s3.id = 2 and s2.id-s1.id = 1) or (s2.id-s1.id = 2 and s2.id-s3.id = 1) or 
       (s1.id-s3.id = 2 and s1.id-s2.id = 1) or (s1.id-s2.id = 2 and s1.id-s3.id = 1))
       and s1.people >= 100 and s2.people >= 100 and s3.people >= 100 
order by s1.id
