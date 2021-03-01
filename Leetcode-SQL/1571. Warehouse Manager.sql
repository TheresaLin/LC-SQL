-- 問題: (列出各個LCHouse的物品體積總和)
-- Write an SQL query to report, How much cubic feet of volume does the inventory occupy in each warehouse.

-- 簡單，就是在from裡面先查詢好每個物品的體積，最後加總
select name as"warehouse_name", sum(units*volume) as "volume" 
from (select product_id, width*length*height as "volume" from products) p 
    join warehouse w on p.product_id=w.product_id group by 1


--後來發現不用先加總也可以
select name as"warehouse_name", sum(units*width*length*height) as "volume" 
from products p join warehouse w on p.product_id=w.product_id group by 1