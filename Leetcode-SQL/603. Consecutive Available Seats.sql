-- 問題: 找兩個以上的空位
-- join同個表但是以相隔一個座位來合併
-- 絕對值:abs(seat1,seat2)=1 用於兩個座位在隔壁

select distinct c1.seat_id  from cinema c1 join cinema c2 on abs(c1.seat_id-c2.seat_id) = 1 
where c1.free=1 and c1.free = c2.free order by seat_id 



-- 連續號碼出現的題目通用
select distinct a.seat_id
from Cinema a, Cinema b
where a.free = 1 and b.free = 1 and
    ((a.seat_id = b.seat_id - 1) or
     (b.seat_id = a.seat_id - 1)
    )
order by 1