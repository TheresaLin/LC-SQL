-- 問題： 把兩個table合併 
-- 用left join，才能強硬把person的東西都印出來

select P.firstName, P.lastName, A.city, A.state
from Person P left join Address A on P.personId = A.personId