-- 問題：讓id=雙數的學生和id=單數的學生交換座位

-- 先從id單雙數對換下手，讓id%2=1(單數)變成id+1，但同時要處理如果最後一號是單數，id就要維持不動
-- 使用if function : if(expression, true, false)
select if(id%2 = 1, 
          if(id = (select max(id) from seat), id, id+1), 
          id-1) as "id", student 
from seat order by 1

-- 使用case when, 速度比較快
select case when id%2 = 1 
            then (case when id = (select max(id) from seat) then id else id+1 end) 
            else id-1 end as "id", student 
from seat order by 1