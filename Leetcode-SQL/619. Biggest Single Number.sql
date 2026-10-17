
-- 找出最大的單一數字。如果沒有單一數字，則報告null。

select max(num) as num
from MyNumbers
where num in(
    select num
    from MyNumbers
    group by num
    having count(num) = 1)