-- 問題：求任兩點的最短距離[(x1-x2)^2 + (y1-y2)^2]^ (1/2)
-- Write a query to find the shortest distance between these points rounded to 2 decimals.

-- 首先先join同張表用where找出不同點，然後就可以開始算距離
-- power(某值,幾次方)，sqrt(要開根號的值)
select min(round(sqrt(power(p1.x-p2.x,2)+power(p1.y-p2.y,2)),2)) as "shortest" 
from point_2d p1 join point_2d p2 where (p1.x, p1.y) != (p2.x, p2.y)