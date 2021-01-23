-- 問題: (算彼此間的距離，列出最短的)Write a query to find the shortest distance between two points in these points.
-- 這題有點酷，距離用絕對值abs()，兩個不同的點用join on兩張同樣的表，表1.點 != 表2.點
select min(distinct abs(p1.x-p2.x)) as shortest from point p1 join point p2 on p1.x != p2.x