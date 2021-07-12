-- 找出可以製造出長方形的兩個點，並算出面積
-- Write an SQL query to report all possible axis-aligned rectangles with non-zero area that can be formed by any two points in the Points table.


-- 這題join on後面設的條件需要考慮兩個點的Ｘ軸或Ｙ軸不相同，不然無法構成一個長方形
-- 面積求兩點Ｘ軸之差＊兩點Ｙ軸之差
select p1.id as "p1", p2.id as "p2", 
       abs(p1.x_value - p2.x_value)*abs(p1.y_value - p2.y_value) as "area" 
from points p1 join points p2 on p1.x_value != p2.x_value and p1.y_value != p2.y_value and p1.id < p2.id 
order by 3 desc, 1, 2